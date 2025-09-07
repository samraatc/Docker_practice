# Docker Compose Keys Reference

## Core & Top-Level Keys

| Key | Description | Example |
| :--- | :--- | :--- |
| `version` | **(Legacy)** Defines the Compose file format version | `version: '3.8'` |
| `name` | Sets a custom project name | `name: my-app` |
| `services` | **Required.** Defines the containers that make up your application | `services: web: ...` |
| `networks` | Configures the custom networks | `networks: app-net: ...` |
| `volumes` | Configures the named volumes for persistent data | `volumes: db-data: ...` |
| `configs` | Grants services access to configuration data | `configs: app-config: ...` |
| `secrets` | Grants services access to sensitive data | `secrets: db-password: ...` |
| `x-*` | Extension fields for custom metadata | `x-my-custom-var: value` |

## Service Definition Keys

### Build & Image Configuration
| Key | Description |
| :--- | :--- |
| `image` | The Docker image to use |
| `build` | Configures how to build the image from a Dockerfile |
| `context` | (Under `build`) Path to the directory containing the Dockerfile |
| `dockerfile` | (Under `build`) Alternate Dockerfile name |
| `args` | (Under `build`) Build-time variables |
| `target` | (Under `build`) Build a specific stage in a multi-stage Dockerfile |
| `pull_policy` | Defines when Docker should pull the image |

### Container Configuration
| Key | Description |
| :--- | :--- |
| `container_name` | Specify a custom container name |
| `restart` | Restart policy |
| `init` | Run an init inside the container |
| `read_only` | Mount the container's root filesystem as read-only |
| `tty` | Allocate a pseudo-TTY |
| `stdin_open` | Keep STDIN open even if not attached |
| `security_opt` | Override default labeling schemes |
| `cap_add` | Add container capabilities |
| `cap_drop` | Drop container capabilities |
| `privileged` | Give extended privileges to this container |

### Command & Entrypoint
| Key | Description |
| :--- | :--- |
| `command` | Override the default command |
| `entrypoint` | Override the default entrypoint |

### Environment & Configuration
| Key | Description |
| :--- | :--- |
| `env_file` | Add environment variables from a file |
| `environment` | Set environment variables directly |
| `configs` | Grant access to configs |
| `secrets` | Grant access to secrets |

### Networking & Ports
| Key | Description |
| :--- | :--- |
| `ports` | Expose container ports to the host machine |
| `expose` | Expose ports without publishing them to the host |
| `networks` | Join the service to specific networks |
| `network_mode` | Connect to the host's network |
| `aliases` | Alternative hostnames for this service |
| `dns` | Custom DNS servers |
| `extra_hosts` | Add hostname mappings |

### Storage & Volumes
| Key | Description |
| :--- | :--- |
| `volumes` | Mount host paths or named volumes |
| `tmpfs` | Mount a temporary filesystem |
| `volumes_from` | Mount all volumes from another service |

### Dependencies & Ordering
| Key | Description |
| :--- | :--- |
| `depends_on` | Express startup dependencies |
| `links` | Legacy container linking |
| `healthcheck` | Configure a health check |
| `deploy` | **(Swarm Mode Only)** Configuration for deploying |

## Network Configuration Keys
| Key | Description |
| :--- | :--- |
| `driver` | Specifies which network driver to use |
| `driver_opts` | Driver-specific options |
| `attachable` | Allows standalone containers to attach |
| `external` | Network created outside of Compose |
| `name` | Exact name of the external network |
| `ipam` | Custom IP Address Management |
| `internal` | Creates an isolated network |

## Volume Configuration Keys
| Key | Description |
| :--- | :--- |
| `driver` | Specifies which volume driver to use |
| `driver_opts` | Driver-specific options |
| `external` | Volume created outside of Compose |
| `name` | Exact name of the external volume |
| `labels` | Add metadata to the volume |

## Config & Secret Keys
| Key | Description | Applies to |
| :--- | :--- | :--- |
| `file` | Path to a file on the host | Both |
| `external` | Defined outside of Compose | Both |
| `name` | Exact name of the external object | Both |
| `environment` | Environment variable for secret data | Secrets |
| `content` | Direct string content | Both |
| `template_driver` | Driver for template interpolation | Configs |
| `labels` | Add metadata using labels | Both |

## The `deploy:` Keys (Swarm Mode Only)
| Key | Description | Category |
| :--- | :--- | :--- |
| `replicas` | Number of identical tasks to run | Scaling |
| `resources` | Configure resource constraints | Resources |
| `limits` | Hard limit of resources | Resources |
| `reservations` | Soft guarantee of resources | Resources |
| `restart_policy` | Configure how to restart tasks | Policy |
| `placement` | Constrain which nodes a task can run on | Placement |
| `update_config` | Configure service updates | Update |
| `rollback_config` | Configure rollbacks | Update |
| `labels` | Add service labels | Metadata |
| `mode` | Service mode (`replicated` or `global`) | Mode |