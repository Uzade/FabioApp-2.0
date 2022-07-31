import { writable, type Writable } from 'svelte/store'
import { browser } from '$app/env'

import type { Lable } from './types'

export const lableStore:Writable<Lable[]> = writable(
    browser && JSON.parse(localStorage.getItem!('lableStore') || JSON.stringify([]))
);
