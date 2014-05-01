# PowerPouch

My digital tools for PowerShell in Windows.

## Requirements

* PowerShell 2.0 or lator

## How to install

Download this repository

or 

```
git clone https://github.com/toooooooby/powerpouch ~\bin[Tab]
```

## For Example: Watch-Folder.ps1

Notice that files update in specific folder.

```
> cd ~\sharefolder\[tab]
> Watch-Folder.ps1 reports\ | write
foobar.txt
(CTRL-C to exit)
```

## For Example: ConvertTo-Pdf.ps1

Convert foobar.xls to foobar.pdf: 

```
> ConvertTo-Pdf.ps1 foobar.xls
Converting foobar.xls to foobar.pdf
```

Convert xls files to PDF automatically in specific folder:

```
> cd ~\Documents\excels[tab]
> Watch-Folder.ps1 -filter '*.xls*' | ConvertTo-Pdf.ps1
Converting foobar.xls to foobar.pdf
Converting hoge.xls to hoge.pdf
(CTRL-C to exit)
```



## Todos

* Modulize?
* Write documents
* Write examples
* Write Tests?

    How to write tests in PowerShell???? Help me!

* How to deal with [my other tool](https://github.com/toooooooby/imperial)?
