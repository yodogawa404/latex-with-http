# latex-with-http
## これは何
自分用のlatex環境。  


## つかいかた
build.shを実行してdockerのimageをビルドする。  
新しいディレクトリを作って移動、そこにdoc.texというファイル名でtexをある程度書く。  
ゲストの``/work/mnt/``に``$PWD``をマウントさせて8080ポートを通し、chromeとかで開くといい感じになる。  
``docker run -it --rm -v $PWD:/work/mnt -p 8080:8080 latex-with-http``をaliasしておくと便利  

## おまけ
### 個人的なtexのテンプレート
```latex
\documentclass[a4paper]{report}
\usepackage[top=15truemm,bottom=15truemm,left=15truemm,right=15truemm]{geometry}
\pagestyle{empty}
\begin{document}

test

\end{document}
```
