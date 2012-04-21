defmodule HelloHandler do
  @behaviour :cowboy_http_handler

  def init({ _any, :http }, req, []) do
    { :ok, req, :undefined }
  end

  def handle(req, state) do
    { :ok, req } = :cowboy_http_req.reply 200, [], "Hello world!", req
    { :ok, req, state }
  end

  def terminate(_request, _state) do
    :ok
  end
end
