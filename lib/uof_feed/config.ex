defmodule UofFeed.Config do
  @moduledoc false

  @environments [
    production: [amqp: "mq.betradar.com", api: "api.betradar.com"],
    integration: [amqp: "stgmq.betradar.com", api: "stgapi.betradar.com"],
    replay: [amqp: "replaymq.betradar.com", api: "stgapi.betradar.com"],
    global_production: [amqp: "global.mq.betradar.com", api: "global.api.betradar.com"],
    global_integration: [amqp: "global.stgmq.betradar.com", api: "global.stgapi.betradar.com"],
    proxy_singapore: [
      amqp: "mq.ap-southeast-1.betradar.com",
      api: "api.ap-southeast-1.betradar.com"
    ],
    proxy_tokyo: [amqp: "mq.ap-northeast-1.betradar.com", api: "api.ap-northeast-1.betradar.com"]
  ]

  def amqp_opts(env, token, bookmaker_id, port \\ 5671) do
    scheme = "amqps"
    host = @environments[env][:amqp]

    {
      "#{scheme}://#{token}@#{host}",
      [
        port: port,
        virtual_host: "/unifiedfeed/#{bookmaker_id}"
      ]
    }
  end
end
