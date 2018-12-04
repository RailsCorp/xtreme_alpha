# frozen_string_literal: true

DeviseTokenAuth.setup do |config|
  # By default the authorization headers will change after each request. The
  # client is responsible for keeping track of the changing tokens. Change
  # this to false to prevent the Authorization header from changing after
  # each request.
  # デフォルトでは、リクエストごとに承認ヘッダーが変更されます。
  # クライアントは、変化するトークンを追跡する責任があります。
  # これをfalseに変更すると、各要求後にAuthorizationヘッダーが変更されないようになります。
  config.change_headers_on_each_request = false

  # By default, users will need to re-authenticate after 2 weeks. This setting
  # determines how long tokens will remain valid after they are issued.
  # デフォルトでは、ユーザーは2週間後に再認証する必要があります。
  # この設定は、トークンが発行された後にトークンが有効である期間を決定します。
  config.token_lifespan = 2.weeks

  # Sets the max number of concurrent devices per user, which is 10 by default.
  # After this limit is reached, the oldest tokens will be removed.
  # ユーザーあたりの最大同時デバイス数を設定します。デフォルトでは10です。
  # この制限に達すると、最も古いトークンが削除されます。
  config.max_number_of_devices = 5

  # Sometimes it's necessary to make several requests to the API at the same
  # time. In this case, each request in the batch will need to share the same
  # auth token. This setting determines how far apart the requests can be while
  # still using the same auth token.
  # APIに複数のリクエストを同時に行う必要があることがあります。
  # この場合、バッチ内の各要求は同じ認証トークンを共有する必要があります。
  # この設定は、同じ認証トークンを使用している間に要求がどれだけ離れているかを決定します。
  # config.batch_request_buffer_throttle = 5.seconds

  # This route will be the prefix for all oauth2 redirect callbacks. For
  # example, using the default '/omniauth', the github oauth2 provider will
  # redirect successful authentications to '/omniauth/github/callback'
  # このルートは、すべてのoauth2リダイレクトコールバックの接頭辞になります。
  # たとえば、デフォルトの '/ omniauth'を使用すると、github oauth2プロバイダは正常な認証を '/ omniauth / github / callback'にリダイレクトします
  # config.omniauth_prefix = "/omniauth"

  # By default sending current password is not needed for the password update.
  # Uncomment to enforce current_password param to be checked before all
  # attribute updates. Set it to :password if you want it to be checked only if
  # password is updated.
  # デフォルトでは、現在のパスワードを送信する必要はありません。
  # すべての属性が更新される前に、current_password paramを検査するように強制してください。
  # パスワードが更新された場合にのみそれをチェックする場合は、パスワードをpasswordに設定します。
  # config.check_current_password_before_update = :attributes

  # By default we will use callbacks for single omniauth.
  # It depends on fields like email, provider and uid.
  # By default we will use callbacks for single omniauth.
  # It depends on fields like email, provider and uid.
  # config.default_callbacks = true

  # Makes it possible to change the headers names
  config.headers_names = {
    'access-token': "access-token",
    client: "client",
    expiry: "expiry",
    uid: "uid",
    'token-type': "token-type"
  }

  # By default, only Bearer Token authentication is implemented out of the box.
  # If, however, you wish to integrate with legacy Devise authentication, you can
  # do so by enabling this flag. NOTE: This feature is highly experimental!
  # デフォルトでは、ベアラトークン認証だけがそのまま実行されます。
  # ただし、従来のDevise認証と統合する場合は、このフラグを有効にすることで実行できます。
  # 注：この機能は非常に実験的です！
  # config.enable_standard_devise_support = false
end
