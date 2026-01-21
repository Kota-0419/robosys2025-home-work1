# robosys2025-home-work1

[![test](https://github.com/Kota-0419/robosys2025-home-work1/actions/workflows/test.yml/badge.svg)](https://github.com/Kota-0419/robosys2025-home-work1/actions/workflows/test.yml)

ログファイルなどに含まれるUnixタイムスタンプ（例: `1732950000`）を、人間が読める日時形式に自動変換するツールです。
ロボットシステム学の課題として作成しました。

## 概要
標準入力から受け取ったテキスト内のUnix時間（`16xxxxxxxxx` または `17xxxxxxxxx`）を検出し、ローカル日時に置換して標準出力します。それ以外のテキストはそのまま出力されます。

## 必要な環境
* Python 3.7 ~ 3.10
* Ubuntu 20.04 / 22.04 (動作確認済み)
* Ubuntu 24.04 (GitHub Actions)

## 準備
以下のコマンドを順番に実行してください。リポジトリを取り込み、作業用ディレクトリへ移動します。
```bash
$ git clone https://github.com/Kota-0419/robosys2025-home-work1.git
$ cd robosys2025-home-work1
```

## 使い方
パイプを使ってデータを流し込みます。

### 実行例
### 1.手入力で試す場合
標準入力から受け取ったテキスト内のUnix時間（`16xxxxxxxxx` または `17xxxxxxxxx`）を検出し、202x-xx-xx xx:xx:xxの形で出力されます。

例1:
```bash
$ echo "1770994800" | ./clock
2026-02-14 00:00:00
```
例2:
```bash
$ echo "1783350000" | ./clock
2026-07-07 00:00:00
```
例3:
```bash
$ echo "渋ハロ:1793372400" | ./clock
渋ハロ:2026-10-31 00:00:00
```
例4:
```bash
$ echo "聖なる夜:1798124400" | ./clock
聖なる夜:2026-12-25 00:00:00
```
例5:
```bash
$ echo "次の元旦:1798729200" | ./clock
次の元旦:2027-01-01 00:00:00
```
### 2.ログファイルを読み込む場合（実践的な使い方）

テスト用ログファイル( test_log.txt )
```bash
[INFO] System boot sequence started at 1735689600
[WARN] Module 'sensor_a' initialization delay.
[DEBUG] timestamp: 1770994800 is set for Valentine event trigger.
[ERROR] Process 112 crashed at 1798124400.543 (Christmas 2026)
This line has no timestamp and should remain unchanged.
Check point A reached: 1783350000 (Tanabata)
[CRITICAL] System overload detected! current_time=1740000000
```
実行結果:
```bash
$ cat test_log.txt | ./clock

[INFO] System boot sequence started at 2025-01-01 09:00:00
[WARN] Module 'sensor_a' initialization delay.
[DEBUG] timestamp: 2026-02-14 00:00:00 is set for Valentine event trigger.
[ERROR] Process 112 crashed at 2026-12-25 00:00:00.543000 (Christmas 2026)
This line has no timestamp and should remain unchanged.
Check point A reached: 2026-07-07 00:00:00 (Tanabata)
[CRITICAL] System overload detected! current_time=2025-02-20 06:20:00
```

## ライセンス
* このソフトウェアパッケージは、3条項BSDライセンスの下、再頒布および使用が許可されます。
* ©2025 Kota Matsura

## 謝辞
*このパッケージの構成や通信の仕組み、テスト方法は、千葉工業大学 ロボットシステム学(2025)の講義資料を参考にしています。
(https://github.com/ryuichiueda/slides_marp/tree/master/robosys2025)
