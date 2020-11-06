project = "hello-world"

app "hello-world" {
  labels = {
      "service" = "hello-world",
  }

  build {
    use "pack" {}
    registry {
        use "docker" {
          image = "hello-world"
          tag = "1"
          encoded_auth = filebase64("/Users/aika/Devops/way-hello/dockerAuth.json")
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
