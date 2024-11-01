defmodule Pscop.DefaultRoles do
    def get_default_roles() do
        [
            %{
                label: "administrator",
                permissions: %{

                    "users"=> ["create", "read", "update", "delete"],
                    "presence"=> ["create", "read", "update", "delete"],
                    "workingtime" => ["create", "read", "update", "delete"],
                    "teams"=> ["create", "read", "update", "delete"]
                }
            },
            %{
                label: "manager",
                permissions: %{
                    "workingtime" => ["create", "read"],
                    "teams"=> ["create", "read", "update", "delete"]
                }
            },
            %{
                label: "general manager",
                permissions: %{
                    "workingtime" => ["create", "read"],
                    "teams"=> ["create", "read", "update", "delete"],
                    "users"=> ["read", "update", "delete"]
                }
            }
        ]
    end
end
