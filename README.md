# Interntrak

Interntrak is a tool for administering Collective Idea's internship program.

## Local Development

1. Install dependencies.

   ```bash
   $ brew install postgresql
   ```

2. Set up the application.

   ```bash
   $ git clone git@github.com:collectiveidea/interntrak.git
   $ cd interntrak
   $ bin/setup
   ```

3. Run the test suite.

   ```bash
   $ bundle exec rake
   ```

4. Start the application.

   ```bash
   $ rails s
   ```
