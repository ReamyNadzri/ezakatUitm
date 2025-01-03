<html>
<head>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap JS (optional, for responsive functionality) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
     <jsp:include page="header.jsp"></jsp:include>
    <style>
        .progress-step {
            width: 35px;
            height: 35px;
            border-radius: 50%;
            background-color: #dee2e6;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #fff;
            position: relative;
            z-index: 1;
        }
        
        .progress-label {
            position: absolute;
            top: 45px;
            font-size: 14px;
            color: #6c757d;
            width: 100px;
            text-align: center;
            margin-left: -32px;
        }
        
        .progress-step.active {
            background-color: #2F6690;
        }
        
        .progress-step.completed {
            background-color: #2F6690;
        }
        
        .progress-line {
            width: 100px;
            height: 3px;
            background-color: #dee2e6;
            margin: 0 -10px;
        }
        
        .progress-line.active {
            background-color: #2F6690;
        }
        
        .card {
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
            border: none;
        }

        .form-section {
            display: none;
        }

        .form-section.active {
            display: block;
        }
    </style>
</head>
<body class="bg-light">

    <div class="container py-5">
        <form action="../addEvent.do" method="POST" enctype="multipart/form-data">
        <div class="card p-4">
            <h4 class="text-center mb-4">Create Your Event</h4>
            
            <!-- Progress Steps -->
            <div class="d-flex justify-content-center align-items-center mb-5">
                <div class="position-relative">
                    <div class="progress-step active" data-step="1">1
                        <div class="progress-label">Event Details</div>
                    </div>
                </div>
                <div class="progress-line" data-line="1"></div>
                <div class="position-relative">
                    <div class="progress-step" data-step="2">2
                        <div class="progress-label">Address</div>
                    </div>
                </div>
                <div class="progress-line" data-line="2"></div>
                <div class="position-relative">
                    <div class="progress-step" data-step="3">3
                        <div class="progress-label">Date & Time</div>
                    </div>
                </div>
             
                <div class="progress-line" data-line="3"></div>
                <div class="position-relative">
                    <div class="progress-step" data-step="4">4
                        <div class="progress-label">Task</div>
                    </div>
                </div>
                <div class="progress-line" data-line="4"></div>
                <div class="position-relative">
                    <div class="progress-step" data-step="4">5
                        <div class="progress-label">Verification</div>
                    </div>
                </div>
            </div>

            <!-- Form Sections -->
            <div class="px-4">
                <!-- Step 1: User Name -->
                <div class="form-section active" data-step="1">
                    <h5 class="mb-2">EVENT INFORMATION</h5>
                    <p class="text-muted mb-4">Provide your event details</p>
                    <div class="mb-3">
                        <label for="eventName" class="form-label">Event Name</label>
                        <input type="text" class="form-control" id="eventName" name="eventName" placeholder="Enter your event name" required>
                    </div>
                    <div class="mb-3">
                         <label for="eventDescription" class="form-label">Event Description</label>
                        <textarea class="form-control" id="eventDescription" name="eventDescription" rows="3" placeholder="Enter your event description" ></textarea>
                    </div>
                     <div class="mb-3">
                        <label for="numParticipants" class="form-label">Number of Participants</label>
                        <input type="number" class="form-control" min="0"  id="numParticipants" name="numParticipants"  placeholder="Enter total participants" >
                    </div>
                    
                    <div class="mb-3">
                    <label for="donationLimit" class="form-label">Donation Limit</label>
                    <input 
                        type="number" 
                        class="form-control" 
                        id="donationLimit" 
                        name="donationLimit" 
                        step="1" 
                        min="0" 
                        max="99999999.99" 
                        placeholder="Enter donation limit (e.g., 500.50)" 
                        required>
                </div>


                      <div class="mb-3">
                        <label for="eventImage" class="form-label">Event Image</label>
                        <input type="file" class="form-control" id="eventImage" name="eventImage" accept="image/*">
                    </div>
                </div>

                <!-- Step 2: Location -->
              <div class="form-section" data-step="2">
    <div class="border-bottom mb-4">
        <h5 class="mb-2">LOCATION INFORMATION</h5>
        <p class="text-muted mb-4">Provide your address details</p>
    </div>

    <div class="row g-4">
        <!-- Street Address - Full Width -->
        <div class="col-12">
            <label class="form-label fw-medium">Street Address <span class="text-danger">*</span></label>
            <input type="text" name="street" class="form-control" placeholder="Enter your street address" required />
        </div>

        <!-- City and State - Two Columns -->
        <div class="col-md-6">
            <label class="form-label fw-medium">City <span class="text-danger">*</span></label>
            <input type="text" name="city" class="form-control" placeholder="Enter your city" required />
        </div>

        <div class="col-md-6">
            <label class="form-label fw-medium">State <span class="text-danger">*</span></label>
             <input type="text" name="state" class="form-control" placeholder="Enter your state" required />
        </div>

        <!-- Postal Code and Country - Two Columns -->
        <div class="col-md-6">
            <label class="form-label fw-medium">Postal Code <span class="text-danger">*</span></label>
            <input type="text" name="postalCode" class="form-control" placeholder="Enter your postal code" required 
                   pattern="[0-9]{5}" title="Please enter a valid 5-digit postal code" />
            <div class="form-text">5-digit postal code</div>
        </div>

        <div class="col-md-6">
            <label class="form-label fw-medium">Country</label>
            <input type="text" name="country" class="form-control"  value="Malaysia" readonly />
        </div>
    </div>

    <!-- Optional Hint Text -->
    <div class="mt-4 text-muted small">
        <i class="bi bi-info-circle me-2"></i>
        All fields marked with <span class="text-danger">*</span> are required
    </div>
</div>

           <div class="form-section" data-step="3">
    <div class="border-bottom mb-4">
        <h5 class="mb-2">EVENT DETAILS</h5>
        <p class="text-muted mb-4">Please provide your event schedule information</p>
    </div>

    <div class="row g-4">
        <!-- Event Date -->
        <div class="col-md-6">
            <label for="eventDate" class="form-label fw-medium">Event Date <span class="text-danger">*</span></label>
            <div class="input-group">
                <span class="input-group-text bg-light">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar-event" viewBox="0 0 16 16">
                        <path d="M11 6.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5z"/>
                        <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5M1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4z"/>
                    </svg>
                </span>
                <input type="date" class="form-control" id="eventDate" name="eventDate" required 
                       min="" /> <!-- min date will be set by JavaScript -->
            </div>
            <div class="form-text">Select a date for your event</div>
        </div>

        <!-- Event Time -->
        <div class="col-md-6">
            <label for="eventTime" class="form-label fw-medium">Event Time <span class="text-danger">*</span></label>
            <div class="input-group">
                <span class="input-group-text bg-light">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clock" viewBox="0 0 16 16">
                        <path d="M8 3.5a.5.5 0 0 0-1 0V9a.5.5 0 0 0 .252.434l3.5 2a.5.5 0 0 0 .496-.868L8 8.71z"/>
                        <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16m7-8A7 7 0 1 1 1 8a7 7 0 0 1 14 0"/>
                    </svg>
                </span>
                <input type="time" class="form-control" id="eventTime" name="eventTime" required />
            </div>
            <div class="form-text">Select the starting time</div>
        </div>

        <!-- Event Duration -->
        <div class="col-12">
            <label class="form-label fw-medium">Event Duration <span class="text-danger">*</span></label>
            <div class="row g-2">
                <div class="col-sm-6">
                    <div class="input-group">
                        <input type="number" class="form-control" id="durationHours" name="durationHours" 
                               placeholder="Hours" min="0" max="24" required />
                        <span class="input-group-text bg-light">Hours</span>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="input-group">
                        <input type="number" class="form-control" id="durationMinutes" name="durationMinutes" 
                               placeholder="Minutes" min="0" max="59" required />
                        <span class="input-group-text bg-light">Minutes</span>
                    </div>
                </div>
            </div>
            <div class="form-text">Enter the duration of your event</div>
        </div> 
    </div>
</div>



                <!-- Step 4: Task -->
                <div class="form-section" data-step="4">
        <!-- Header -->
        <div class="mb-4">
            <h5 class="fw-bold">TASK INFORMATION</h5>
            <p class="text-muted">Provide your task list</p>
        </div>

        <!-- Task Input Form -->
        <div class="card mb-4 border-0 shadow-sm">
            <div class="card-body">
                <div class="row g-3">
                    <div class="col-lg-9">
                        <input type="text" id="taskInput" class="form-control" placeholder="Enter task name">
                    </div>
                    <div class="col-lg-3">
                        <button type="button" onclick="addTask(event)" class="btn btn-primary w-100">
                            <i class="fas fa-plus me-2"></i>Add Task
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Task List -->
        <div class="card border-0 shadow-sm">
            <div class="card-body p-0">
                <div class="table-responsive">
                    <table class="table table-hover mb-0" id="taskTable">
                        <thead class="table-light">
                            <tr>
                                <th class="px-4" style="width: 5%">#</th>
                                <th class="px-4" style="width: 75%">Task Name</th>
                                <th class="px-4" style="width: 20%">Actions</th>
                            </tr>
                        </thead>
                        <tbody id="taskList">
                            <!-- Empty state -->
                            <tr id="emptyState">
                                <td colspan="3" class="text-center py-5">
                                    <i class="fas fa-tasks mb-3 text-muted" style="font-size: 2rem;"></i>
                                    <p class="text-muted mb-0">No tasks added yet</p>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>

               <div class="form-section" data-step="5">
                    <h5 class="mb-3">Verification</h5>
                    <p class="text-muted">Final verification step before submitting the form.</p>
                    <div class="form-check mb-3">
                        <input class="form-check-input" type="checkbox" id="termsCheck">
                        <label class="form-check-label" for="termsCheck">
                            I confirm that all the details provided are correct.
                        </label>
                    </div>
                </div>

                <!-- Navigation Buttons -->
                <div class="d-flex justify-content-between mt-4">
                    <button type="button" class="btn btn-outline-secondary" id="prevBtn" onclick="prevStep()">Previous</button>
                    <button type="button" class="btn btn-success" id="nextBtn" onclick="nextStep()">Next</button>
                </div>
            </div>
        </div>
            </form>
    </div>
   

    
    <script>
        let currentStep = 1;
        const totalSteps = 5;

        function updateButtons() {
            const prevBtn = document.getElementById('prevBtn');
            const nextBtn = document.getElementById('nextBtn');
            
            prevBtn.style.display = currentStep === 1 ? 'none' : 'block';
            
          if (currentStep === totalSteps) {
                nextBtn.textContent = 'Submit';  
            } else {
                nextBtn.textContent = 'Next';
                nextBtn.setAttribute('type', 'button'); 
            }
                    }

        function updateSteps() {
            // Update progress steps
            document.querySelectorAll('.progress-step').forEach((step, index) => {
                const stepNum = index + 1;
                if (stepNum < currentStep) {
                    step.classList.add('completed');
                    step.classList.remove('active');
                } else if (stepNum === currentStep) {
                    step.classList.add('active');
                    step.classList.remove('completed');
                } else {
                    step.classList.remove('completed', 'active');
                }
            });

            // Update progress lines
            document.querySelectorAll('.progress-line').forEach((line, index) => {
                if (index + 1 < currentStep) {
                    line.classList.add('active');
                } else {
                    line.classList.remove('active');
                }
            });

            // Show/hide form sections
            document.querySelectorAll('.form-section').forEach((section) => {
                if (parseInt(section.dataset.step) === currentStep) {
                    section.classList.add('active');
                } else {
                    section.classList.remove('active');
                }
            });

            updateButtons();
        }

       function nextStep() {
            if (currentStep < totalSteps) {
                currentStep++;
                updateSteps();
            } 
            else{
                const nextBtn = document.getElementById('nextBtn');
                    nextBtn.setAttribute('type', 'submit');
            }
        }


        function prevStep() {
            if (currentStep > 1) {
                currentStep--;
                updateSteps();
            }
        }
        
                    // Set minimum date to tomorrow
            window.addEventListener('load', function() {
                const tomorrow = new Date();
                tomorrow.setDate(tomorrow.getDate() + 1);
                const formattedDate = tomorrow.toISOString().split('T')[0];
                document.getElementById('eventDate').min = formattedDate;
            });

            // Validate duration inputs
            document.getElementById('durationHours').addEventListener('input', function() {
                if (this.value > 24) this.value = 24;
                if (this.value < 0) this.value = 0;
            });

            document.getElementById('durationMinutes').addEventListener('input', function() {
                if (this.value > 59) this.value = 59;
                if (this.value < 0) this.value = 0;
            });



            // Array to store tasks
            let taskArray = [];
            let taskCount = 1;  // Assuming task count starts from 1

            function addTask(event) {
                // Prevent the form from submitting (which causes the page redirect)
                event.preventDefault();

                const taskInput = document.getElementById('taskInput');
                const taskName = taskInput.value.trim();

                // Validate if task name is empty
                if (!taskName) {
                    alert('Task name cannot be empty!');
                    return;
                }

                // Remove empty state if present
                const emptyState = document.getElementById('emptyState');
                if (emptyState) {
                    emptyState.remove();
                }

                // Create task row
                const taskList = document.getElementById('taskList');
                const row = document.createElement('tr');
                row.innerHTML =
                    '<td class="px-4">' + taskCount + '</td>' +
                    '<td class="px-4">' +
                        '<span class="task-name">' + taskName + '</span>' +
                        '<input type="text" class="form-control d-none edit-input" value="' + taskName + '">' +
                    '</td>' +
                    '<td class="px-4">' +
                        '<div class="btn-group btn-group-sm">' +
                            '<button class="btn btn-outline-primary" onclick="editTask(this)">' +
                                '<i class="fas fa-edit"></i>' +
                            '</button>' +
                            '<button class="btn btn-outline-danger" onclick="deleteTask(this)">' +
                                '<i class="fas fa-trash"></i>' +
                            '</button>' +
                        '</div>' +
                    '</td>';

                // Append the new task to the list
                taskList.appendChild(row);

                // Add the task to the task array
                taskArray.push(taskName);

                // Increment task count and clear the input
                taskCount++;
                taskInput.value = '';
            }

            // Edit task
            function editTask(button) {
                const row = button.closest('tr');
                const nameSpan = row.querySelector('.task-name');
                const nameInput = row.querySelector('.edit-input');

                if (nameSpan.classList.contains('d-none')) {
                    // Save changes
                    const newName = nameInput.value.trim();
                    if (!newName) {
                        return;
                    }
                    nameSpan.textContent = newName;
                    nameSpan.classList.remove('d-none');
                    nameInput.classList.add('d-none');
                    button.innerHTML = '<i class="fas fa-edit"></i>';

                    // Update the task in the array
                    const taskIndex = Array.from(row.parentElement.children).indexOf(row);
                    taskArray[taskIndex] = newName;  // Update the array with the new task name
                } else {
                    // Show edit input
                    nameSpan.classList.add('d-none');
                    nameInput.classList.remove('d-none');
                    nameInput.focus();
                    button.innerHTML = '<i class="fas fa-save"></i>';
                }
            }

            // Delete task
            function deleteTask(button) {
                const row = button.closest('tr');
                const taskList = document.getElementById('taskList');

                if (confirm('Are you sure you want to delete this task?')) {
                    row.remove();

                    // Remove task from the array
                    const taskIndex = Array.from(row.parentElement.children).indexOf(row);
                    taskArray.splice(taskIndex, 1);

                    // Show empty state if no tasks remain
                    if (taskList.children.length === 0) {
                        taskList.innerHTML = `
                            <tr id="emptyState">
                                <td colspan="3" class="text-center py-5">
                                    <i class="fas fa-tasks mb-3 text-muted" style="font-size: 2rem;"></i>
                                    <p class="text-muted mb-0">No tasks added yet</p>
                                </td>
                            </tr>
                        `;
                    }
                }
            }
                document.addEventListener('DOMContentLoaded', function() {
                var form = document.querySelector('form[action="../addEvent.do"][method="POST"]');


                    form.addEventListener('submit', function(event) {
                        // Clear any existing hidden task inputs
                        var existingTaskInputs = this.querySelectorAll('input[name^="task"]');
                        existingTaskInputs.forEach(function(input) {
                            input.remove();
                        });

                        // Add hidden inputs for each task
                        taskArray.forEach(function(task, index) {
                            var nameInput = document.createElement('input');
                            nameInput.type = 'hidden';
                            nameInput.name = 'task[' + index + '].name';
                            nameInput.value = task.taskName;
                            form.appendChild(nameInput);
                        });
                    });
                });
    </script>
</body>
</html>