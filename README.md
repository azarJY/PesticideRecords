# 農効

## サイト概要
農業の効率化のために、棟や区画ごとで管理できる農薬使用記録を目的とした記録アプリです

### サイトテーマ
「農耕」の「効率化」として名を「農効」としており、現代でも紙で管理されることの多い各処理に革命をもたらすのがテーマです


### テーマの選定理由・興味
　現職にて夏イチゴの栽培に携わっているのですが、農薬の使用記録は紙で管理していました。
記録が増えると煩雑になるだけでなく、各区画ごとの薬剤使用回数など調べる際不便に感じることがありました。

　そのためこれらを一覧で見やすくできるサイトがあれば便利だと考え、本テーマにしました。
農業協同組合などから農薬の管理アプリなどは出ているのですが、各棟の使用記録やどのページでもすぐに希釈量が計算できたり栽培区画を分けての農薬使用回数が見れるといったものは探した限りでは見つからなかったため
そういった機能を盛り込むことで他サイトとの差別化を図っています

### ターゲットユーザ
- 農薬使用記録表の作成を電子媒体で管理したい人
- 農場の管理者や、家庭菜園が趣味の人など農産物の生産に携わる人、もしくはこれから携わる人

### 主な使用シーン
- 農薬使用の際必須となる記録の時
- 過去の記録や使用量を調べて在庫棚卸等の時に役立てたい時
- 農薬希釈量の計算・確認したい時
- 今シーズンの農薬の使用回数を、栽培区画ごとに知りたい時


#### 使い方
- まずアカウントを作成します。ゲストログインして頂けると実際に登録された記録の見本を見ることができます
- 次に各ハウスや露地の場合区画などを管理しやすいよう決め登録をします
- 次に使用予定の農薬を登録します
- シーズン時期を設定していただけますと、シーズン内における農薬の使用回数を各栽培区画ごとに表示することができます
- ここまできたらページ左側の希釈量計算器を活用していただき農薬使用記録表に必要事項を記入していただきます

### 設計書

![PF-noukouインフラ設計図](https://github.com/azarJY/PesticideRecords/assets/143927567/20fc6f84-69a2-4fb6-9d45-b3a8211de112)


### 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQ
- 仮想サーバ：EC2
- レイアウト調整：Boostrap
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9

### 使用素材

ヘッダー写真→自身が撮影
Google Fontよりフォント素材「Yuji Boku」
Fontawesome.comより各種アイコン
