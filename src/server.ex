defmodule SimpleWebServer do
  @behaviour :application

  defp start_app(app) do
    status = :application.start app
    IO.puts "Starting up #{app}... #{inspect status}"
  end

  def start do
    start_app :cowboy
    start_app SimpleWeb
  end

  def start(_type, _args) do
    dispatch = [{:_, [
      {:_, HelloHandler, []}
    ]}]

    :cowboy.start_listener :my_http_listener, 100,
      :cowboy_tcp_transport, [{:port, 8000}],
      :cowboy_http_protocol, [{:dispatch, dispatch}]

    SimpleWebSup.start_link
  end

  def stop(_state) do
    :ok
  end
end
