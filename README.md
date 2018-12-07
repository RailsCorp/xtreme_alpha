# Xtreme

[![codecov](https://codecov.io/gh/RailsCorp/xtreme_alpha/branch/master/graph/badge.svg)](https://codecov.io/gh/RailsCorp/xtreme_alpha)


* Docker内に入るコマンド

```
$ docker exec -it xtreme_server bash
```

* Devise Token Auth認証について

- http://clc.gonna.jp/2017/01/post-1306/
- https://www.slideshare.net/fumiyasakai37/rails5api


* controllerの生成

```
bundle exec rails g controller <...>
```

* Modelの生成

```
bundle exec rails g mdoel <...>
```

* migrationファイルの生成

```
bundle exec rails g migration <...>
```

* dbをmigrate

```
bundle exec rails db:migrate
```

* migrateなどで失敗した時の対処法

 １つのテーブルに１つのmigrationファイルにすること！ (無駄にファイル数を増やしたくない)

```
bundle exec rails db:migrate:reset
```

* RSpec実行

```
bundle exec rspec <ディレクトリ>
```

* Rubocopの実行(自動修正モード)

```
bundle exec rubocop -a
```

# appディレクトリ構成

```
app/
 ┣━ assets/
 ┣━ channels/
 ┣━ controllers/
 ┣━ decorators/ gem `draper`を使用
 ┣━ helpers/ 未使用
 ┣━ jobs/ 今の所使う予定なし
 ┣━ mailers/ action mailerとして使う可能性あり
 ┣━ models/ fatモデルにならないように気をつける
 ┣━ usecases/ service層 controllerやmodelのdelegateモジュール
 ┣━ queries/ controllerでの処理のフィルタリングに使用
 ┗━ views/ json.jbuilderで書く。
```


# DeviseTokenAuthを用いた認証周りに関する知識


認証は DeviseTokenAuthを用いて

`api/auth/registrations_controller.rb`が `DeviseTokenAuth::RegistrationsController`を継承！

`createsメソッド`は`DeviseTokenAuth::RegistrationsController`を用いて、`sign_up_params`はオーバーライドしている。

`app/controllers/application_controller`が`DeviseTokenAuth::Concerns::SetUserByToken`モジュールをincludeしているため、どのcontrollerでもいちいちaccess-tokenなどを定義する必要なし。


`csrf対策`はまだ未定。今後に導入。

### devise_token_auth

devise_token_authは、headerに`"access-token"`、`"client"`、`uid`を乗せてリクエスト送る。

```
{
  "access-token": "lhG-DTB64dyOlv1e-6BAiQ",
  "client": "RqCpylnDWcDUQVntAbpyDw",
  "uid": "admin1@example.com"
}
```

使えるメソッド

```
1. api_user_signed_in?
2. before_action :authenticate_api_user!
3. current_api_user
```

### PostmanからUserオブジェクトを作るときに

```
{
	"name": "hogehoge1",
	"email": "hogehoge1@hoge.com",
	"password": "hogehoge1",
	"password_confirmation": "hogehoge1",
	"reset_password_token": "hoegehoge1",
	"uid": "hogehoge1@hoge.com"
}
```