defmodule HelloWeb.Ecolive do 
    use HelloWeb, :live_view 

    @impl true 
    def mount(_params, _session, socket) do 
        {:ok, assign(socket, texto: "")}
    end 

    @impl true 
    def handle_event("actualizar", %{"mensaje" => mensaje}, socket) do
        {:noreply, assign(socket, texto: mensaje)}
    end

    @impl true 
    def render(assigns) do
        ~H"""
        <div class="p-6 max-w-xl mx-auto">
            <h1 class="text-2xl font-bold mb-4">Eco Page</h1>

            <form phx-change="actualizar">
                <input
                type="text"
                name="mensaje"
                placeholder="Escribe algo…"
                class="border p-2 w-full rounded"
                />
            </form>

            <p class="mt-4 text-lg text-gray-700">
                Tú escribiste: <strong><%= @texto %></strong>
            </p>
        </div>
        """
    end
end
#YAIR GUZMAN