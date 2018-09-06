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
  [x] generate SessionsController
  [x] draw sessions routes
       GET '/login' to sessions#new as
       POST '/login' to sessions#create
  [x] Make a view for the log in page
  [/] sessions#new -> Log In
      logic to instantiate a session
      re-read authentication or re watch TODO MVC authenticate lectures
  [x] sessions#create -> Authenticate
  ___ Later: sessions#destroy -> Log Out! What route would this be? A GET and then a PATCH? To destroy the current session?


  [ ] Authorization logic before_action with a helper method established
      [ ] #logged_in?  "if a session[:hiker_id] exists, the user can see the page"
      - What can a user see if not logged in?
        - The Welcome Page (App#welcome controller), Sign Up Page (Hiker#new Controller), or Log In Page (Sessions Controller)
      - What can a user see if logged in?
        - Their Show Page
        - Aspiration CRUD (It's personal!)
        - TBD: Trail CRUD pages (Should I have a pre-made list, or allow users to CRUD?)

Step 7: OAUTH
  [ ] OAuth through what strategy ???
      - Try Google


Step 8: MODEL VALIDATIONS
  [ ] What validations would you like for each model?
      HIKER: Must have: Username/Password, Username must be unique
      TRAIL: Must have: Name, Location, Unique Name (?)
      ASPIRATION: Hiker and Trail must exist (?!)  If User wants to add a trail ... ?
  ___ Later?:
              - All usernames should be saved as downcase.
              - Usernames should NOT be case sensitive.

STEP 8.5: Re-Do User Sign Up with new validations

STEP ___ :
  [ ] Utilize "field-with-errors" on Log In and Sign Up pages.

Step 9: NESTED RESOURCE
  [ ] Add Aspiration nested under Hiker resource '/hikers/1/aspirations/new'


Step 10: SCOPE METHODS
  [ ] Write one of the following scope methods:
      HIKER: #trails_completed (number of aspirations with "completed => true")
      TRAIL: #hikers_completed (number of hikers that completed)
             #hikers_aspiring (number of hikers with this trail_id in aspirations list)



STEP 100: Open up the screen shot from Luisa about what you might be asked during the assessment.  Look up MVC useage and request / response patterns
