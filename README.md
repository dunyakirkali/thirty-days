# 30Days
[staging](http://thirty-days-web.herokuapp.com/)
![tests](https://magnum-ci.com/status/209ad2835c10685d1325103544e4cb8b.png)

## Tasks
``` foreman run rake users:remind ```

## Development

### Start rails server
``` foreman start -f Procfile.dev -e Procfile.dev.env ```

### Start rails console
``` foreman run rails c -e Procfile.dev.env ```

## Test
``` foreman run rspec -e Procfile.test.env ```