project = "hello-world"

app "hello-world" {
  labels = {
      "service" = "hello-world"
  }

  build {
    use "docker" {}
    registry {
        use "docker" {
          image = "birnazarova/hello-world"
          tag = "v2"
          encoded_auth = filebase64("/Users/aika/Devops/way-hello1/dockerAuth.json")
        }
    }
 }

  deploy { 
    use "kubernetes" {
    probe_path = "/"
    }
  }

  release {
    use "kubernetes" {
    }
  }
}
