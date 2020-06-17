# Notule Harvester [Archived]

This has been replaced with [app-centrale-vindplaats](https://github.com/lblod/app-centrale-vindplaats)

## Running and maintaining

  General information on running and maintaining an installation

### Running your setup

  ```
  docker-compose up
  ```

  The stack is built starting from [mu-project](https://github.com/mu-semtech/mu-project).

### Upgrading your setup

  Once installed, you may desire to upgrade your current setup to follow development of the main stack. The following example describes how to do this easily for both the demo setup, as well as for the dev setup.

### Cleaning the database

  At some times you may want te clean the database and make sure it's in a pristine state.

      # Bring down our current setup
      docker-compose -f docker-compose.yml -f docker-compose.dev.yml down
      # Keep only required database files
      rm -Rf data/db
      git checkout data/db
      # Bring the stack back up
      docker-compose -f docker-compose.yml -f docker-compose.dev.yml up

  Make sure to wait for the migrations to run.
