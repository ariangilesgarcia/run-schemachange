# GitHub Action: Run schemachange

Run migrations using the schemachange database change management tool.


## Development

To test this action locally, build the docker image
```bash
docker build -t run-schemachange:dev .
```

To run the image on your `schemachange` project you must have:
- A `schemachange-config.yml` file with all your migrations settings
- A folder with `sql` files following `schemachange` naming convention
- Assuming your config file is in the current directory, run:
```bash
docker run -e SNOWFLAKE_PASSWORD=<YOUR_PASSWORD> -v $(pwd):/ run-schemachange:dev .
```

## Usage

To use this action we need two things:
- A `schemachange-config.yml` file
- The `SNOWFLAKE_PASSWORD` environment variable set with your Snowflake password
  - You can create it as a [repository secret](https://docs.github.com/en/actions/security-guides/encrypted-secrets), and then referece it like `${{ secrets.SNOWFLAKE_PASSWORD }}` in your workflow

```yaml
- uses: ariangilesgarcia/run-schemachange@v1
  with:
    # Config folder (where the schemachange-config.yml file is located)
    # Default: ./
    config-folder: "./migrations/config"
    env:
      SNOWFLAKE_PASSWORD: ${{ secrets.SNOWFLAKE_PASSWORD }}
```


## Arguments

| **Input**           | **Description**                                                   | **Default** | **Required** |
| :------------------ | :---------------------------------------------------------------- | :---------: | :----------: |
| **`config-folder`** | Config folder (where the schemachange-config.yml file is located) |    `./`     |  **false**   |

