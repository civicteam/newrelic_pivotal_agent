FROM ruby:1.9.3

# Ruby gems dependency listing file
COPY Gemfile .

# Install deps
RUN bundle install

# Copy other project files
COPY . .

# Install confd for config templating
RUN curl -sSL -o /usr/local/bin/confd https://github.com/kelseyhightower/confd/releases/download/v0.16.0/confd-0.16.0-linux-amd64 \
  && chmod +x /usr/local/bin/confd

# Used for confd configuration file
RUN mkdir -p /etc/confd/conf.d
# Used for config templates source folder
RUN mkdir -p /etc/confd/templates

# Conf.d configuration itself
COPY confd/newrelic_plugin.toml /etc/confd/conf.d/newrelic_plugin.toml

# NewRelic plugin config temaplate that will be processed
COPY confd/newrelic_plugin.yml.tmpl /etc/confd/templates/newrelic_plugin.yml.tmpl

RUN chmod +x ./start.sh

# Entry point
CMD ["./start.sh"]
