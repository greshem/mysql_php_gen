
	 # some useful options (see below for full list)
	 my $config = {
	#     INCLUDE_PATH => ’/search/path’,  # or list ref
	     INTERPOLATE  => 1,		      # expand "$var" in plain text
	     POST_CHOMP	  => 1,		      # cleanup whitespace
	  # PRE_PROCESS  => ’header’,	      # prefix each template
	     EVAL_PERL	  => 1,		      # evaluate Perl code blocks
	 };
	 # create Template object
	@a=qw( aaa bbb ccc ddd eee fff);
	 #my $template = Template->new($config);
	 my $template = Template->new();

	 # define template variables for replacement
	 my $vars = {
	     db  => $db,
	     table => $table,
	     fields => \@fields
	 };
	 
	 #my $input = ’a.tpl’;
	my $input="template/table_list.tpl";

	 # process input template, substituting variables
	 $template->process($input, $vars, $output )
	     || die $template->error();


