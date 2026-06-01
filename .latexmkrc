$latex = 'uplatex -synctex=1 -halt-on-error -file-line-error -interaction=nonstopmode';
$bibtex = 'upbibtex';
#$latex = 'platex -synctex=1 -halt-on-error -file-line-error -interaction=nonstopmode';
#$bibtex = 'pbibtex';
$dvipdf = 'dvipdfmx %O -o %D %S';
$makeindex = 'upmendex %O -o %D %S';
$pdf_mode = 3;
