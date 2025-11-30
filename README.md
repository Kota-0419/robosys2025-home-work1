# robosys2025-home-work1

[![test](https://github.com/Kota-0419/robosys2025-home-work1/actions/workflows/test.yml/badge.svg)](https://github.com/Kota-0419/robosys2025-home-work1/actions/workflows/test.yml)

ログファイルなどに含まれるUnixタイムスタンプ（例: `1732950000`）を、人間が読める日時形式に自動変換するツールです。
ロボットシステム学の課題として作成しました。

## 概要
標準入力から受け取ったテキスト内のUnix時間（`16xxxxxxxxx` または `17xxxxxxxxx`）を検出し、ローカル日時に置換して標準出力します。それ以外のテキストはそのまま出力されます。

## 必要な環境
* Python 3.7 以上
* Ubuntu 20.04 / 22.04 (動作確認済み)

## インストール方法
リポジトリをクローンし、ディレクトリに移動します。

## 使い方
実行権限を与えてから、パイプを使ってデータを流し込みます。
### 1.実行権限の付与
```bash
chmod +x main.py
```
### 2.実行例
* 手入力で試す場合
```bash
echo "Current time: 1732950000" | ./main.py
```

* ログファイルを読み込む場合（実践的な使い方）
```bash
cat robot_data.log | ./main.py
```

　出力結果:Current time: 2024-11-30 16:00:00


```bash
git clone https://github.com/Kota-0419/robosys2025-home-work1.git
cd robosys2025-home-work1
```

## ライセンス
* このソフトウェアパッケージは、3条項BSDライセンスの下、再頒布および使用が許可されます。
* ©2025 Kota Matsura
