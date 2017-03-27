# Blocmetrics

### analytics service to track events on websites




**Connecting to Blocmetrics:** In order to link blocmetrics to your application, you will need:
- An account 
- Your application registered with blocmetrics (using it's unique URL)
- The following JS snippet placed in your code:
        ```
        var blocmetrics = {};
        
        blocmetrics.report = function(eventName) {
            var event = {event: { name: eventName}};
            
            var request = new XMLHttpRequest();
            
            request.open("POST", "https://blocmetrics-mftaff.c9users.io:8080/api/events", true);
            request.setRequestHeader('Content-Type', 'application/json');
            request.send(JSON.stringify(event));
        };
        ```
        
Example of `blocmetrics.report` in action:
        
        $( document ).ready(function() {
            blocmetrics.report('page load');
        });
        
