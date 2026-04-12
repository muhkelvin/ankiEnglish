import { createClient } from './supabase/server'

export async function getUser() {
  const supabase = await createClient()
  const { data: { user }, error } = await supabase.auth.getUser()
  if (error || !user) return null
  return user
}

export async function requireUser() {
  const user = await getUser()
  if (!user) {
    throw new Error('Unauthorized')
  }
  return user
}

export async function getUserProfile() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return null

  const { data: profile } = await supabase
    .from('users')
    .select('*')
    .eq('id', user.id)
    .single()

  return profile
}

export async function requireAdmin() {
  const profile = await getUserProfile()
  if (!profile || profile.role !== 'admin') {
    throw new Error('Forbidden')
  }
  return profile
}

export function apiResponse(data, status = 200) {
  return Response.json(data, { status })
}

export function apiError(message, status = 400) {
  return Response.json({ error: message }, { status })
}
