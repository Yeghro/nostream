import { Event } from "../@types/event";

export function isValidContent(event: Event): boolean {
  // List of forbidden words
  const forbiddenWords = ["#loli", "#lolita", "#NSFW"];

  // Extract content from the event, defaulting to an empty string if not present
  const content = event.content || "";

  // Check if the content includes any forbidden words
  return !forbiddenWords.some((word) => content.includes(word));
}
