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
## Roles and Permissions

This app has a very basic authorization approach. A user has a single role, either "intern", "team", "admin", or "unassigned". New users are defaulted to the "unassigned" role until an admin sets the correct role for them. This prevents improper access to the app's features.

Only an admin can:

* view the list of users,
* view an intern's journal entries,

Only an intern can:

* create a new journal entry,
* edit a journal entry,
