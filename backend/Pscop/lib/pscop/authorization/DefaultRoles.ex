defmodule Pscop.DefaultRoles do
    def get_default_roles() do
        [
            %{
                label: "facilitator",
                permissions: %{
                    "users"=> ["create", "read"],
                    "attendance"=> ["create", "read"],
                    "account" => ["read", "update"],
                }
            },
            %{
                label: "general manager",
                permissions: %{
                    "users"=> ["create", "read", "update", "delete"],
                    "attendance"=> ["create", "read", "update", "delete"],
                    "account" => ["create", "read", "update", "delete"],
                }
            }
        ]
    end
end
