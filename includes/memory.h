#ifndef CLOX_MEMORY_H
#define CLOX_MEMORY_H

#include <common.h>

#define GROW_CAPACITY(capacity) ((capacity) < 8 ? 8 : (capacity) * 2)
#define GROW_ARRAY(type, ptr, oldCount, newCount) \
	(type*)reallocate(ptr, sizeof(type) * oldCount, sizeof(type) * newCount)

#define FREE_ARRAY(type, ptr, oldCount) \
	(type*)reallocate(ptr, sizeof(type) * oldCount, 0);

void*	reallocate(void* ptr, size_t oldSize, size_t newSize);

#endif