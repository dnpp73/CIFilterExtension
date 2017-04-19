CIFilterExtension
===========

Inspired by [`jefflovejapan/CIFilterKit`](https://github.com/jefflovejapan/CIFilterKit)


## ToDo

- Write Super Cool README.
- Make Ultra Cool Sample App.


## What is this

`CIFilter` についてドキュメントを読みながら調査してたら [`jefflovejapan/CIFilterKit`](https://github.com/jefflovejapan/CIFilterKit) を見付けたのだけど、更新が止まっており Swift 3.0 ではなかったので、参考にしつつ試しに自分で一つ書いてみたのだけど、最終的に手作業でチマチマ増やしてたらこんなことになってしまった。

`CIFilter` 自体はカーネルをまとめてフィルタグラフを形成するにとどまり、可能な限りイメージの遅延評価を試みる。画像処理に於いて重い処理は概ねコンボリューション周りであって、それに比べフィルタグラフ自体は富豪的に都度生成しても実用上問題にならないし、たぶん `CIFilter` のインターフェースから察するに内部でキャッシュが走りやすい構造になっているのでこういう形に実装した。


## Datasource?

You can use [`dnpp73/SimpleCamera`](https://github.com/dnpp73/SimpleCamera)


## How to draw `CIImage`

You can use [`dnpp73/GPUCIImageView`](https://github.com/dnpp73/GPUCIImageView)


## Poem

最近の iOS 界隈というか Swift 界隈、型に厳密でクールでお洒落なライブラリじゃないとダサいみたいな風潮あると思うんだけど、完全に個人で自分が使うためだけに書いたというか、知らん、これは俺が使うんだ！！！俺こそがユーザーだ！！！


## Carthage

https://github.com/Carthage/Carthage

Write your `Cartfile`

```
github "dnpp73/CIFilterExtension"
```

and run

```sh
carthage bootstrap --no-use-binaries --platform iOS
```


## How to Use

To be written...


## License

[MIT](/LICENSE)
