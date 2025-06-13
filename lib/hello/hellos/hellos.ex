defmodule Hello.Hellos do
  import Ecto.Query, warn: false
  alias Hello.Repo
  alias Hello.Hello

  #Funcion para crear mensaje 
  def create_hello(attrs \\ %{}) do
    %Hello{}
    |> Hello.changeset(attrs)
    |> Repo.insert()
  end

  #Con este vamos a poder listar los mensajes guardados 
  def list_hello do 
    Repo.all(Hello)
  end

  #Con este obtendremos un mensaje por ID
  def get_hello!(id), do: Repo.get!(Hello, id)

  #Ahora con esta funcion vamos a poder actualizar nuestro mensaje 
  def update_hello(%Hello{} = hello, attrs) do
    hello
    |> Hello.changeset(attrs)
    |> Repo.update()
  end

  #Con esta funcion podremos eliminar un mensaje 
  def delete_hello(%Hello{} = hello) do
    Repo.delete(hello)
  end

end
