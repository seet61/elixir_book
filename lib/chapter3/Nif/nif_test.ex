defmodule NifTest do
  #@on_load :load_nif

  # code uglified to keep the post short
  def load_nif do
    #nif_path = :my_app |> :code.priv_dir() |> List.to_string() |> Path.join("my_app_nif") |> String.to_charlist()
    :erlang.load_nif('./SOAP/rtsib', 0) # Fails with 'vendor.so' cannot open shared object file: No such file or directory
  end
end
