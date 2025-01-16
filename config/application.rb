require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.2

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    # Content Security Policy の設定
    config.content_security_policy do |policy|
      policy.default_src :self # デフォルトで自分自身のみ許可
      policy.script_src :self, :unsafe_inline # スクリプトは自分自身とインラインスクリプトを許可
      policy.style_src :self, :unsafe_inline # CSSは自分自身とインラインスタイルを許可
      policy.img_src :self, :data # 画像は自分自身とデータスキームを許可
      policy.connect_src :self # 接続先は自分自身のみ
      policy.report_uri '/csp-violation-report' # レポート送信先を指定
    end

    # レポートモードのみ有効化する場合（強制適用しない場合）
    config.content_security_policy_report_only = true
  end
end
