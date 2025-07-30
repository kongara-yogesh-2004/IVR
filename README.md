# LLMPoweredVirtualAgent
Repo for GenAI powered Virtual Agent/IVR services


Yogesh : https://youtu.be/5SJOkWH5hzU<br>

# WebRTC Voice Chat Application with Admin and User

## Description

This application allows **USER** (customer) to connect with an **ADMIN** (Virtual Agent/service provider) for a voice chat via WebRTC. The application includes login functionality for both admins and users, call initiation, and call termination features.

## Features

- **Admin and User Login**: Admins log in with a specific ID, while users can log in without an ID.
- **Voice Call**: Users can initiate a call that connects directly to the admin. _**Condition**: Call connects only if the admin is available on the server._
- **Call Control**: Both users and admins can end the call at any time.

## Workflow

### Admin Login

1. Admin clicks the **"Admin Login"** button.
2. Admin enters their ID (e.g., `admin123`).
3. Admin's microphone access is requested and enabled.
4. Admin is marked as available for calls.

### User Login

1. User clicks the **"User Login"** button.
2. User is notified if the admin is available.
3. **Start Call** and **End Call** buttons are enabled.

### Starting a Call

1. User clicks the **"Start Call"** button.
2. User's microphone access is requested and enabled.
3. WebRTC connection is established, and an offer is sent to the admin.

    _**NOTE**: Call connects if and only if the admin is available to take calls (i.e., admin should be logged in)._

### Handling the Call

1. Admin receives the offer, creates an answer, and establishes the connection.
2. Only the user can initiate the call.

### Ending the Call

1. Either the user or the admin can end the call by clicking the **"End Call"** button.
2. WebRTC connection is closed, and audio streams are stopped.

## Deployment

**Deployed Link of the Application**: [https://webrtc-admin.onrender.com](https://webrtc-admin.onrender.com)

