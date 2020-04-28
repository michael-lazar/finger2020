# Finger2020

*A tiny, secure [finger](https://en.wikipedia.org/wiki/Finger_protocol) daemon for single-user unix systems.*

## About

This finger service will not extract any user information directly from the host
system. So relax! Only one user profile is supported (hence, "single-user").
It's intended to be used by the server's sysop to broadcast news and/or personal
contact information over the internet.

## Operation

This program is designed to be hosted behind a systemd socket or a comparable
inetd-like service. The program will read a one-line finger query from stdin.
The response string will be written to stdout, and all error/logging messages
will be directed to stderr and should be setup to route to an appropriate
system log manager.

## Query Support

Only user list and user status queries are supported. Queries with ambiguous
user names will be rejected. Finger forwarding services using host names is not
supported. The verbose flag (`/W`) is allowed but its value will be disregarded.


## Usage

```bash
# Query user list
echo -e "\r\n" | finger2020

# Query user information
echo -e "username\r\n" | finger2020
```

## Configuration

Settings are defined through environment variables.

#### ``FINGER_NAME``
The "login name" that the finger user will be displayed as. This is
typically a lowercase ASCII user handle.

#### ``FINGER_CONTACT``
This file replaces the section of the query response that contains
information that finger would typically automatically generate. Common
values in this section include login name, real name, phone number,
address, is the user logged in, the last time their email was checked, etc.

#### ``FINGER_PROJECT``
This file typically contains a short, single line message about what the
user is currently working on.

#### ``FINGER_PLAN``
This file typically contains freeform text that the user would like to
broadcast. There is no recommended format and a user might include things
like their work calender, personal ascii art, or a list of tasks to do.

## Links

- [RFC 1288 - The Finger User Information Protocol](https://tools.ietf.org/html/rfc1288)
- [History of the Finger Protocol](http://www.rajivshah.com/Case_Studies/Finger/Finger.htm)
- [finger URL Specification](https://tools.ietf.org/html/draft-ietf-uri-url-finger-02)
