alias Pscop.DefaultRoles
alias Pscop.Services.Roles
alias Faker

for role <- DefaultRoles.get_default_roles() do
    unless Roles.get_role_by_label!(role.label) do
        {:ok, _role} = Roles.create_role(role)
    end
end
