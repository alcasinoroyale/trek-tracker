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
    x -Link to Sign Up

Step 4: Update Hiker to change :name to :username and add :password_digest
  [x] add has_secure_password to Hiker model
  [x] does gemfile include bcrypt?

Step 5:
  Sign Up Page    hiker#new
    [x] Form with information... username, password, hometown ZIP
    __ (Later: Confirm that zipcode exists -- validation !!! )
    __ (Later: Do I need a password_confirmation? --> Not yet)

    *ISSUE* Drawing a route to '/signup' instead of '/hikers/new'  I explicitly drew the route instead of using a hiker as a resource.  I need to get the route prefixes to work (hiker_path, new_hiker_path)  If I use a resource, how can I make the route go to /signup?  If I do not use a resource, how can I get the route prefixes to work?
    *Answer* I am utilizing resources for now. I will later try to edit the URL to '/signup' instead of '/hikers/new'

  Sign Up Page    hiker#Create
    [x] Successfully create a Hiker - preliminary

Step 6: Log In and Log Out (Authentication) * Later
  [ ] generate SessionsController
  [ ] sessions#new -> Log In
  [ ] sessions#create -> Authenticate
  [ ] Authorization logic
      - What can a user see if not logged in?
        - The Welcome Page, Sign Up Page, or Log In Page
      - What can a user see if logged in?
        - Their Show Page
        - Aspiration CRUD (It's personal!)
        - TBD: Trail CRUD pages (Should I have a pre-made list, or allow users to CRUD?)

Step 7: OAUTH
  [ ] OAuth through what strategy ???


Step 8: MODEL VALIDATIONS
  [ ] What validations would you like for each model?
      HIKER: Must have: Username/Password, Username must be unique
      TRAIL: Must have: Name, Location, Unique Name (?)
      ASPIRATION: Hiker and Trail must exist (?!)  If User wants to add a trail ... ?

STEP 8.5: Re-Do User Sign Up with new validations

Step 9: NESTED RESOURCE
  [ ] Add Aspiration nested under Hiker resource '/hikers/1/aspirations/new'
