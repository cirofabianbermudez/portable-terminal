# portable-terminal

**portable-terminal** is a Linux terminal environment that runs directly in your browser, offering a familiar command-line interface (CLI) experience. It leverages GitPod's capabilities to provide a fully-functional VSCode setup with pre-installed common CLI tools, making it accessible from any device with a browser, without needing to carry your laptop everywhere.

## Key Features

- **Browser-based Linux Terminal**: Access a complete Linux environment through your browser without needing to set up local installations.
- **VSCode Integration**: Enjoy all the development features of VSCode alongside your terminal.
- **Pre-installed CLI Tools**: Common command-line tools are available out-of-the-box to streamline development tasks.
- **Portability**: Access your environment from any machine without sacrificing your customized toolset.

## CLI Tools

*Taken from the Gitpod website:*

By default, GitPod uses a standard Docker image called `Workspace-Full` as the foundation for workspaces. Workspaces started from this image come pre-installed with:

**Programming languages**: Docker, Nix, Go, Java, Node.js, C/C++, Python, Ruby, Rust, Clojure
**Utilities**: Homebrew, Tailscale, Nginx, and many more.

## Pre-installed Additional Tools

In addition to the default setup, we've included several more useful CLI tools:

- [Ghostcript](https://www.ghostscript.com/): A versatile interpreter for PostScript and PDF files.
- [ImageMagick](https://imagemagick.org/index.php): A powerful tool for editing and converting images.
- [PDFtk](https://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/): A toolkit for working with PDFs, including merging and splitting documents.
- [Gnuplot](http://www.gnuplot.info/): A portable command-line driven graphing utility.
- [TeX Live](https://www.tug.org/texlive/): A comprehensive TeX system for compiling LaTeX documents.

## Pdftk

### Merging PDFs

To merge multiple PDFs into one file, use the following command:

```bash
pdftk file1.pdf file2.pdf file3.pdf cat output merged.pdf
```

- `file1.pdf`, `file2.pdf`, etc. are the input PDFs.
- `cat` combines them in the order listed.
- `output merged.pdf` specifies the name of the output file.

### Splitting PDFs

To split a PDF into individual pages:

```bash
pdftk input.pdf burst
```

This command will create a separate PDF for each page in `input.pdf`, named `pg_0001.pdf`, `pg_0002.pdf`, etc.

### Extracting Specific Pages

You can extract specific pages from a PDF into a new file:

```bash
pdftk input.pdf cat 1-5 7 10-12 output extracted_pages.pdf
```

This example extracts pages 1 to 5, 7, and 10 to 12.

### Rotating Pages

To rotate pages the format is:

```bash
pdftk input.pdf cat [page_range] output output.pdf
```

For rotating pages, you need to specify:

- Page range: Which pages you want to rotate (e.g., `1-3` for pages 1 to 3, or `1-end` for all pages).
- Rotation direction: 
  - `N`: No rotation (default).
  - `E`: Rotate 90 degrees clockwise (to the east).
  - `S`: Rotate 180 degrees (upside down).
  - `W`: Rotate 90 degrees counterclockwise (to the west).

## ImageMagick

### Convert PNG to PDF

To convert a PNG file to PDF, you can use the `convert` command:

```
convert input.png output.pdf
```

If you have multiple PNG files that you want to combine into a single PDF, you can list all the PNG files in the command:

```
convert file1.png file2.png output.pdf
```

## Ghostscript

### Compress PDF

To compress the PDF use the following command:

```bash
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -dAutoRotatePages=/None -sOutputFile=output.pdf input.pdf
```
