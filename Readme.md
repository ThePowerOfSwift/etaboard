
## Development setup

* install all dependencies: `make configure`
* generate artifacts: `make dictionaries-from-scratch generate-code`
* run unit tests: `make precheck`
* open XCode project


## Deploy

To TestFlight: `make beta`


## Conventions

Name store actions from the user’s perspective. Do not name the consequences of the action. That’s what the reducers are for. Start the name with a past participle. Example: `ActivatedCapitalization`.

