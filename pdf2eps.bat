rem pdf2eps <page number> <pdf file without ext>
pdfcrop "%2.pdf" "%2.pdf"
pdftops -f %1 -l %1 -eps "%2.pdf" "%2.eps"