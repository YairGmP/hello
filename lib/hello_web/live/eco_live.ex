defmodule HelloWeb.Ecolive do 
  use HelloWeb, :live_view 

  @impl true
  def mount(_params, _session, socket) do
    mensajes = Hello.Hellos.list_hello()
    {:ok, assign(socket, texto: "", mensajes: mensajes)}
  end

  # Crear nuevo mensaje
  @impl true 
  def handle_event("actualizar", %{"mensaje" => mensaje}, socket) do
    Hello.Hellos.create_hello(%{mensaje: mensaje})
    nuevos_mensajes = Hello.Hellos.list_hello()
    {:noreply, assign(socket, texto: mensaje, mensajes: nuevos_mensajes)}
  end

  # Eliminar mensaje 
  @impl true
  def handle_event("eliminar", %{"id" => id}, socket) do
    mensaje = Hello.Hellos.get_hello!(id)
    {:ok, _} = Hello.Hellos.delete_hello(mensaje)
    nuevos_mensajes = Hello.Hellos.list_hello()
    {:noreply, assign(socket, mensajes: nuevos_mensajes)}
  end

  # Editar un mensaje
  @impl true
  def handle_event("editar", %{"id" => id, "nuevo" => nuevo}, socket) do
    mensaje = Hello.Hellos.get_hello!(id)
    {:ok, _} = Hello.Hellos.update_hello(mensaje, %{mensaje: nuevo})
    nuevos_mensajes = Hello.Hellos.list_hello()
    {:noreply, assign(socket, mensajes: nuevos_mensajes)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="p-6 max-w-3xl mx-auto">
      <h1 class="text-2xl font-bold mb-4">Eco Page</h1>

      <!-- Formulario de creación -->
      <form phx-submit="actualizar" class="mb-6">
        <input type="text" name="mensaje" placeholder="Escribe un mensaje..." class="border p-2 rounded w-2/3" />
        <button type="submit" class="ml-2 bg-blue-500 text-white px-4 py-2 rounded">Enviar</button>
      </form>

      <p class="mb-4 text-lg text-gray-700">
        Tú escribiste: <strong><%= @texto %></strong>
      </p>

      <hr class="my-6" />

      <h2 class="text-xl font-semibold mb-4">Mensajes guardados</h2>

      <table class="w-full table-auto border-collapse border border-gray-300">
        <thead>
          <tr class="bg-gray-100">
            <th class="border border-gray-300 px-4 py-2 text-left">Mensaje</th>
            <th class="border border-gray-300 px-4 py-2 text-center">Acciones</th>
          </tr>
        </thead>
        <tbody>
          <%= for mensaje <- @mensajes do %>
            <tr>
              <td class="border px-4 py-2"><%= mensaje.mensaje %></td>
              <td class="border px-4 py-2 text-center">
                <form phx-submit="editar" class="inline-block">
                  <input type="hidden" name="id" value={mensaje.id} />
                  <input type="text" name="nuevo" value={mensaje.mensaje} class="border p-1 rounded w-40" />
                  <button type="submit" class="ml-2 text-blue-600">Actualizar</button>
                </form>
                <button type="button"
                        phx-click="eliminar"
                        phx-value-id={mensaje.id}
                        class="ml-4 text-red-600">Eliminar</button>
              </td>
            </tr>
          <% end %>
        </tbody>
      </table>
    </div>
    """
  end
end
