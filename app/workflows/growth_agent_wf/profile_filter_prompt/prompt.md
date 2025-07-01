Given the following IT profiles, return the names of those that match any of the following roles or stacks.
Each profile within the IT Profiles array is delimited with ***.
Roles: <%= workflow.output["brief_parser"]["roles"] %>
Stacks: <%= workflow.output["brief_parser"]["stack"] %>
IT Profiles: <%= workflow.output["notion_profiles_getter"]["notion_profiles"] %>

RESPONSE FORMAT: You must respond in JSON format within <json> XML tags.

<json>
{
  "profiles": [
    {
      "name": "profileName",
      "matchingReason": "role or stack that you identified as a match"
    }
  ]
  "unmatchedProfiles": [
    {
      "name": "profileName",
      "reason": "no matching role or stack found"
    }
  ]
}
</json>