<?

class AsPagebar {

var $total; 
var $onepage;
var $num;
var $pagecount;
var $total_page;
var $offset;
var $linkhead; 

function AsPagebar($total, $onepage, $form_vars='') {
$pagecount = $_GET['pagecount'];
$this->total = $total;
$this->onepage = $onepage;
$this->total_page = ceil($total/$onepage);

if (empty($pagecount)) {
$this->pagecount = 1;
$this->offset = 0; 
}else {
$this->pagecount = $pagecount;
$this->offset = ($pagecount-1)*$onepage;
}

if (!empty($form_vars)) {

$vars = explode("|", $form_vars);
$chk = $vars[0];
$chk2 = $vars[1];
$chk_value = $_POST["$chk"];
$chk_value2 = $_POST["$chk2"];
if (empty($chk_value) && empty($chk_value2)) {
$formlink = "";
}else {
for ($i=0; $i<sizeof($vars); $i++) {
$var = $vars[$i];
$value = $_POST["$var"];
$addchar = $var."=".$value;

$formlink = $formlink.$addchar."&";
}
}
}else {
$formlink = "";
}

$linkarr = explode("pagecount=", $_SERVER['QUERY_STRING']);
$linkft = $linkarr[0];

if (empty($linkft)) {
$this->linkhead = $_SERVER['PHP_SELF']."?".$formlink;
}else {
$linkft = (substr($linkft, -1)=="&")?$linkft:$linkft."&";
$this->linkhead = $_SERVER['PHP_SELF']."?".$linkft.$formlink;
}

}
#End of function PageBar();

/**+-----------------------------------------------
| ����ȡ��select��ָ��.
| i.e. $pb = new PageBar(50, 10);
| $offset = $pb->offset();
| +-----------------------------------------------
*/
function offset() {
return $this->offset;
}
#End of function offset();


/**+-----------------------------------------------
| ȡ�õ�һҳ.$linkΪ1��Ϊ������
| i.e. $pb = new PageBar(50, 10);
| $first_page = $pb->first_page(1);
| +-----------------------------------------------
*/
function first_page($link='', $char='', $color='') {
$linkhead = $this->linkhead;
$linkchar = (empty($char))
? "<font color='$color'>[��ҳ]</font>"
: $char;
if ($link==1) {
return "<a href=\"$linkhead"."pagecount=1\" title=\"��ҳ\" class=\"page_black\">$linkchar</a>";
}else {
return 1;
}
}
#End of function first_page();

/**+-----------------------------------------------
| ȡ����ĩҳ.$linkΪ1��Ϊ������
| i.e. $pb = new PageBar(50, 10);
| $total_page = $pb->total_page(1);
| +-----------------------------------------------
*/
function total_page($link='', $char='', $color='') {
$linkhead = $this->linkhead;
$total_page = $this->total_page;
$linkchar = (empty($char))
? "<font color='$color'>[".$total_page."]</font>"
: $char;
if ($link==1) {
return "<a href=\"$linkhead"."pagecount=$total_page\" title=\"βҳ\" class=\"page_black\">[βҳ]</a>";
}else {
return $total_page;
}
}


/**+-----------------------------------------------
| ȡ����ĩҳ.$linkΪ1��Ϊ������
| i.e. $pb = new PageBar(50, 10);
| $total_page = $pb->total_page(1);
| +-----------------------------------------------
*/
function jump_page($link='', $char='', $color='') {
$linkhead = $this->linkhead;
$total_page = $this->total_page;

	if($total_page>1)
	{
		$jump_bar="��ת������<select name=\"pagecount\" onChange=\"javascript:window.location='".$linkhead."pagecount=' + pagecount.value+''\">";
		$jump_bar.="<option value=\"1\" >-</option>";
		for ($i=1; $i<=$total_page; $i++) 
		{
			$jump_bar.="<option value=\"$i\" >$i</option>";
		}
		$jump_bar.="</select>ҳ";
	}

return $jump_bar;
}



/**+-----------------------------------------------
|  ��ת��
|  i.e. $pb           = new PageBar(50, 10);
|  �ر�˵�� $jump='' �����ͬһҳҪ������Jump_form
|  �����Ҫ�趨��ͬ��$jump�������������
|  $Jump_form    = $pb->Jump_form();
| +-----------------------------------------------
*/
function Jump_form($jump='') {
$formname = "pagebarjumpform".$jump;
$jumpname = "jump".$jump; 
$jy_num = "jy_num".$jump; 

$linkhead = $this->linkhead;
$total = $this->total_page;
$form = <<<EOT
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<SCRIPT language=JavaScript>

	function $jy_num(ctrl,n)
	{
		var num=ctrl.value;
		if(num.search(/^[0-9]+(\.[0-9]*)?$/gi)!= -1)
			return true;
		else
		{
			ctrl.value=n;
			ctrl.focus();
			return false;
		}
	}
	</SCRIPT>
    <script language="javascript">
        function $jumpname(linkhead, total, page){
            
            var pagecount = (page.value>total)?total:page.value;
            pagecount = (pagecount<1)?1:pagecount;
            location.href = linkhead + "pagecount=" + pagecount;
            return false;
        }
    </script>
       <form name="$formname" method="post" onSubmit="return $jumpname('$linkhead', $total, $formname.page)"><tr>
          <td>
        <input name="page" type="text" size="1" maxlenght="4" onkeyup=$jy_num($formname.page,'')>
        <input type="button" name="Submit" value="GO" onClick="return $jumpname('$linkhead', $total, $formname.page)">
      </td>
        </tr></form></table>
EOT;
return $form;
}
#End of function Jump_form();



/**+-----------------------------------------------
| ȡ����һҳ.$charΪ���ӵ��ַ�,Ĭ��Ϊ"[<]"
| i.e. $pb = new PageBar(50, 10);
| $pre_page = $pb->pre_page("��һҳ");
| +-----------------------------------------------
*/
function pre_page($char='') {
$linkhead = $this->linkhead;
$pagecount = $this->pagecount;
if (empty($char)) {
$char = "[<]";
}

if ($pagecount>1) {
$pre_page = $pagecount - 1;
return "<a href=\"$linkhead"."pagecount=$pre_page\" title=\"��һҳ\" class=\"page_black\">$char</a>";
} else {
return '';
}
}
#End of function pre_page();

/**+-----------------------------------------------
| ȡ����һҳ.$charΪ���ӵ��ַ�,Ĭ��Ϊ"[>]"
| i.e. $pb = new PageBar(50, 10);
| $next_page = $pb->next_page("��һҳ");
| +-----------------------------------------------
*/
function next_page($char='') {
$linkhead = $this->linkhead;
$total_page = $this->total_page;
$pagecount = $this->pagecount;
if (empty($char)) {
$char = "[>]";
}
if ($pagecount<$total_page) {
$next_page = $pagecount + 1;
return "<a href=\"$linkhead"."pagecount=$next_page\" title=\"��һҳ\" class=\"page_black\">$char</a>";
} else {
return '';
}
}
#End of function next_page();

/**+-----------------------------------------------
| ȡ��ҳ��������. $num Ϊ����,Ĭ��Ϊ10
| $color Ϊ��ǰ���ӵ�ͻ����ɫ
| $left ������� Ĭ��Ϊ"[" 
| $right �������� Ĭ��Ϊ"]"
| i.e. $pb = new PageBar(50, 10);
| $num_bar = $pb->num_bar(9, "$cccccc");
| +-----------------------------------------------
*/
function num_bar($num='', $color='', $maincolor='', $left='', $right='') {
$num = (empty($num))?10:$num;
$this->num = $num;
$mid = floor($num/2);
$last = $num - 1; 
$pagecount = $this->pagecount;
$totalpage = $this->total_page;
$linkhead = $this->linkhead;
$left = (empty($left))?"[":$left;
$right = (empty($right))?"]":$right;
$color = (empty($color))?"#ff0000":$color;
$minpage = (($pagecount-$mid)<1)?1:($pagecount-$mid);
$maxpage = $minpage + $last;
if ($maxpage>$totalpage) {
$maxpage = $totalpage;
$minpage = $maxpage - $last;
$minpage = ($minpage<1)?1:$minpage;
}

for ($i=$minpage; $i<=$maxpage; $i++) {
$chars = $left.$i.$right;
$char = "<font color='$maincolor'>".$chars."</font>";
if ($i==$pagecount) {
$char = "<font color='$color'>$chars</font>";
}

$linkchar = "<a href='$linkhead"."pagecount=$i' class=\"page_black\">".$char."</a>";
$linkbar .= $linkchar;
}

return $linkbar;
}
#End of function num_bar();


/**+-----------------------------------------------
| ȡ����һ��������.$charΪ���ӵ��ַ�,Ĭ��Ϊ"[<<]"
| i.e. $pb = new PageBar(50, 10);
| $num_bar = $pb->num_bar();
| $pre_group = $pb->pre_group();
| +-----------------------------------------------
*/
function pre_group($char='') {
$pagecount = $this->pagecount;
$linkhead = $this->linkhead;
$num = $this->num;
$mid = floor($num/2);
$minpage = (($pagecount-$mid)<1)?1:($pagecount-$mid);
$char = (empty($char))?"[<<]":$char;
$pgpagecount = ($minpage>$num)?$minpage-$mid:1;
return "<a href='$linkhead"."pagecount=$pgpagecount' title=\"��һ��\" class=\"page_black\">".$char."</a>";
}
#End of function pre_group();

/**+-----------------------------------------------
| ȡ����һ��������.$charΪ���ӵ��ַ�,Ĭ��Ϊ"[>>]"
| i.e. $pb = new PageBar(50, 10);
| $num_bar = $pb->num_bar();
| $next_group = $pb->next_group();
| +-----------------------------------------------
*/
function next_group($char='') {
$pagecount = $this->pagecount;
$linkhead = $this->linkhead;
$totalpage = $this->total_page;
$num = $this->num;
$mid = floor($num/2);
$last = $num; 
$minpage = (($pagecount-$mid)<1)?1:($pagecount-$mid);
$maxpage = $minpage + $last;
if ($maxpage>$totalpage) {
$maxpage = $totalpage;
$minpage = $maxpage - $last;
$minpage = ($minpage<1)?1:$minpage;
}

$char = (empty($char))?"[>>]":$char;
$ngpagecount = ($totalpage>$maxpage+$last)?$maxpage + $mid:$totalpage;

return "<a href='$linkhead"."pagecount=$ngpagecount' title=\"��һ��\" class=\"page_black\">".$char."</a>";
}
#End of function next_group();

/**+-----------------------------------------------
| ȡ����������������һҳ����һҳ����һ��
| ��һ��ĵ�.$num���ָ���,$color ��ǰ���ӵ�ͻ��ɫ
| i.e. $pb = new PageBar(50, 10);
| $whole_num_bar = $pb->whole_num_bar(9);
| +-----------------------------------------------
*/
function whole_num_bar($num='', $color='', $maincolor='') {
$num_bar = $this->num_bar($num, $color, $maincolor);
//return $this->first_page(1, '', $maincolor).$this->pre_group("<font color='$maincolor'>[<<]</font>").$this->pre_page("<font color='$maincolor'>[<]</font>").$num_bar.$this->next_page("<font color='$maincolor'>[>]</font>").$this->next_group("<font color='$maincolor'>[>>]</font>").$this->total_page(1, '', $maincolor);
return $this->first_page(1, '', $maincolor).$this->pre_group("<font color='$maincolor'>[<<]</font>").$this->pre_page("<font color='$maincolor'>[<]</font>").$num_bar.$this->next_page("<font color='$maincolor'>[>]</font>").$this->next_group("<font color='$maincolor'>[>>]</font>").$this->total_page(1, '', $maincolor).$this->jump_page(1, '', $maincolor);
}
#End of function whole_bar();


/**+-----------------------------------------------
| ȡ�������ӣ�����whole_num_bar���ϱ���ת.
| $num���ָ���,$color ��ǰ���ӵ�ͻ��ɫ
| i.e. $pb = new PageBar(50, 10);
| $whole_bar = $pb->whole_bar(9);
| +-----------------------------------------------
*/
function whole_bar($jump='', $num='', $color='', $maincolor='') {
$whole_num_bar = $this->whole_num_bar($num, $color, $maincolor)."&nbsp;";
$jump_form = $this->jump_form($jump);
return <<<EOT
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr> 
<td align="left" class="page_black">$whole_num_bar</td>
<td width="80">$jump_form</td>
</tr>
</table>
EOT;
}

}

?> 
