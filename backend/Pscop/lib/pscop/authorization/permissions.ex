defmodule Pscop.Permissions do
    import Ecto.Changeset

    def all_permissions() do
        %{
            "users"=> ["create", "read", "update", "delete"],
            "attendance"=> ["create", "read", "update", "delete"],
            "account" => ["create", "read", "update", "delete"],
        }
    end

    def user_has_permission?(role, permission) do
        has_permission?(role.permissions, permission)
    end

    def validate_permissions(changeset, field) do
        validate_change(changeset, field, fn _field, permissions ->
        permissions
        |> Enum.reject(&has_permission?(all_permissions(), &1))
        |> case do
            [] -> []
            invalid_permissions ->[{field, {"invalid_permissions", invalid_permissions}}]
            end
        end)
    end

    def has_permission?(permissions, {name, action}) do
        exists?(name, permissions) && actions_valid?(name, action, permissions)
    end

    defp exists?(name, permissions), do: Map.has_key?(permissions, name)

    defp actions_valid?(permission_name, given_action, permissions) when is_binary(given_action) do
        actions_valid?(permission_name, [given_action], permissions)
    end

    defp actions_valid?(permission_name, given_actions, permissions) when is_list(given_actions) do
        defined_actions = Map.get(permissions, permission_name)
        Enum.all?(given_actions, &(&1 in defined_actions))
    end
end
