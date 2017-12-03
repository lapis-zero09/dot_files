#!/usr/bin/env perl

$latex                       = 'uplatex -synctex=1 -halt-on-error %O %S';
$latex_silent                = 'uplatex -synctex=1 -halt-on-error -interaction=batchmode %O %S';
$bibtex                      = 'upbibtex %O %B';
$biber                       = 'biber --bblencoding=utf8 -u -U --output_safechars';
$dvipdf                      = 'dvipdfmx %O -o %D %S';
$makeindex                   = 'mendex -U %O -o %D %S';
$max_repeat                  = 5;
$pdf_mode                    = 3;

$pvc_view_file_via_temporary = 0;
# $pdf_previewer               = 'open -a /Applications/Skim.app';

