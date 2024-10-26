import { Event } from '../@types/event'

export function isValidContent(event: Event): boolean {
  // List of forbidden words
  const forbiddenWords = [
    '#loli',
    'nigger',
    'NIGGER',
    'nigger!',
    'NIGGER!',
    'NIGGERS',
    'niggers',
    'niggers!',
    'NIGGERS!',
    'niggers!!',
    'NIGGERS!!',
    '#LOLI',
    '#LOLITA',
    '#lolita',
    '#NSFW',
    '#nsfw',
    '#lewd',
    '#LEWD',
    '#shota',
    '#SHOTA',
    '#Shota',
    '#ShotaOnShota',
    '#shotaonshota',
    '#lolix',
    '#Lolix',
    '#lolixshota',
    '#LoliXshota',
    '#LOLIXSHOTA',
    '#LoliOnShota',
    '#ShotaxShota',
    '#shotaxshota',
    '#lolicon',
    '#LoliCon',
    '#toddlercon',
    '#ToddlerCon',
    '#Cunny',
    '#cunny',
    '#thecloudhouse',
    '#TheCloudHouse',
    '#konosuba',
    '#Konosuba',

  ]

  // Extract content from the event, defaulting to an empty string if not present
  const content = event.content || ''

  // Check if the content includes any forbidden words
  return !forbiddenWords.some((word) => content.includes(word))
}