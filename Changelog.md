# Change log

# unreleased (master)

## New Features

* Update `droplet_kit` for major ver. 3
* Add check of droplet size for creation
* Do not force 2.0.1 of `droplet_kit`
* Change default region to `nyc3`
* Add ability to retry request if error happened
* Do not try to read new token if old token is incorrect

### changes
* `wait_until_droplet_have_status` now raise DropletOperationTimeout if timeout reached

# 0.2.0
* Force use ruby 2.2 to be able use `activesupport 5` 

# 0.1.0
* Add ability to set tags for restored instances

## 0.0.1
* Initial release of `onlyoffice_webdriver_wrapper` gem