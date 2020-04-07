# Ada Students API

The following program is an Rails application designed to produce a simple RESTful API for student data.

## Routes

This api supports the following routes

- `get` `/students` - Lists all students in the system
- `get` `/students/:id` - Lists a specific student with the given id
- `delete` `/students/:id` - Deletes the student with the matching id
- `patch` `/students/:id` - Updates a student with the following information in the request body.
    - `fullName` - string, required
    - `is_present` - boolean
    - `email` - string, required, must be unique
- `post` `/students` - creates a student with the given information in the request body
    - `fullName` - string, required
    - `is_present` - boolean
    - `email` - string, required, must be unique


This basic API is designed to support the [ada students](https://github.com/AdaGold/ada-students) livecode.
