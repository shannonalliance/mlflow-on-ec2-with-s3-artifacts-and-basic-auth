from mlflow.server.auth.client import AuthServiceClient
client = AuthServiceClient("https://your.domain.name")
client.create_user("newuser", "password")
