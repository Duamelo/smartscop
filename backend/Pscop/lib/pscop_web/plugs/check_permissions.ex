defmodule PscopWeb.Plugs.CheckPermissions do
    import Plug.Conn

    alias Pscop.Permissions
    alias Pscop.Services.Roles

    def init(opts), do: opts

    def call(conn, opts) do
        role = get_user_role(conn)
        required_permission = get_required_permission(conn, opts)

        if Permissions.user_has_permission?(role, required_permission) do
            conn
        else
            conn
            |> Plug.Conn.resp(403, "Forbidden")
            |> halt()
        end
    end

    defp get_user_role(conn) do
        Roles.get_role!(conn.assigns.current_user_role)
    end

    defp get_required_permission(conn, opts) do
        action = conn.private[:phoenix_action]

        opts
        |> Keyword.fetch!(:actions)
        |> Keyword.fetch!(action)
    end
end
