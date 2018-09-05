# Hike Aspiration Tracker

Step 1: Models and Relationships
  Hiker has_many aspirations
        has_many trails through aspirations
  Aspiration belongs_to hiker
             belongs_to trail
  Trail has_many aspirations (?)
        has_many hikers through aspirations

Details: A hiker can create an aspiration. The hiker can choose from existing trails, or, create a new trail to aspire to.
Future: The app can aggregate a list of trails that exist in PA via AllTrails.com or DCNR.pa.giv

Step 2: Decide Page Flow/Stub out Flow
  Q: What can visitors see on the site?  Do they need to sign up to access content? What content can they access when logged in?

  - Hiker CRUD --> Sign Up Page
  - Trail CRUD --> Who can control this? Can hikers CRUD trails? How will I avoid duplications?
  - Aspiration CRUD --> Controlled by Hiker

  Seemingly, the visitor can sign up (Create Hiker) and go to their Hiker page (no aspirations yet)

  From there, the Hiker can go through a list of Trails and add them to their aspiration list, or create a list of aspirations from their page.


Step 3: Create a route...
  x Welcome Page    application#welcome
    -Link to Log In
    -Link to Sign Up

  Sign Up Page    hiker#new
    -Form with information

Step 4: Update Hiker to change :name to :username and add :password_digest
  [ ] add has_secure_password to Hiker model
  [ ] does gemfile include bcrypt?

Step 6: Log In and Log Out (Authentication) * Later
  [ ] generate Sessions Controller
  [ ] sessions#new -> Log In
  [ ] sessions#create -> Authenticate
  [ ] OAuth through what strategy ???
