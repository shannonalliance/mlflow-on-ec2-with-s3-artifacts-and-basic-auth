from mlflow.server.auth.client import AuthServiceClient
client = AuthServiceClient("https://your.domain.name")
client.update_user_password("usertomodify", "newpassword")
