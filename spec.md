# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (show has many users, users have many shows) 
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
- [x] Include at least two has_many through relationships (shows have many users through notes, users have many shows through notes)
- [x] Include at least one many-to-many relationship (see number five)
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (notes have content)
- [x] Include reasonable validations for simple model objects (Note, Show, User)
- [x] Include a class level ActiveRecord scope method (just_added sorts shows by date added)
- [x] Include signup (how e.g. Devise)
- [x] Include login (how e.g. Devise)
- [x] Include logout (how e.g. Devise)
- [x] Include third party signup/login (OmniAuth)
- [x] Include nested resource show or index (e.g. /shows/8/notes)
- [x] Include nested resource "new" form (URL e.g. /shows/8/notes/new)
- [x] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate