#ifndef VectorTest_h_CPPUNIT
#define VectorTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCVector.h"
class VectorTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( VectorTestTest );
//register each method:

    CPPUNIT_TEST(VectorDestructor_false_destruct);
    CPPUNIT_TEST(VectorDestructor_true_destruct);
    CPPUNIT_TEST(VectorInitializer_false_initialize);
    CPPUNIT_TEST(VectorInitializer_true_initialize);

    CPPUNIT_TEST(VectorInitializer_true_true_initialize);
    CPPUNIT_TEST(VectorMover_false_move);
    CPPUNIT_TEST(VectorMover_false_moveOverlapping);

    CPPUNIT_TEST(VectorMover_true_move);
    CPPUNIT_TEST(VectorMover_true_moveOverlapping);
    CPPUNIT_TEST(VectorCopier_false_uninitializedCopy);
    CPPUNIT_TEST(VectorCopier_true_uninitializedCopy);
    CPPUNIT_TEST(VectorFiller_false_uninitializedFill);
    CPPUNIT_TEST(VectorFiller_true_uninitializedFill);
    
    CPPUNIT_TEST(VectorComparer_false_compare);
    CPPUNIT_TEST(VectorComparer_true_compare);
    
   
    CPPUNIT_TEST(VectorTypeOperations_destruct);
    CPPUNIT_TEST(VectorTypeOperations_initialize);
    CPPUNIT_TEST(VectorTypeOperations_move);
    CPPUNIT_TEST(VectorTypeOperations_moveOverlapping);
    CPPUNIT_TEST(VectorTypeOperations_uninitializedCopy);
    CPPUNIT_TEST(VectorTypeOperations_uninitializedFill);
    CPPUNIT_TEST(VectorTypeOperations_compare);

    CPPUNIT_TEST(VectorBufferBase_allocateBuffer);
    CPPUNIT_TEST(VectorBufferBase_deallocateBuffer);
    CPPUNIT_TEST(VectorBufferBase_buffer);
    CPPUNIT_TEST(VectorBufferBase_buffer2);
    CPPUNIT_TEST(VectorBufferBase_bufferSlot);
    CPPUNIT_TEST(VectorBufferBase_capacity);
    CPPUNIT_TEST(VectorBufferBase_releaseBuffer);
    CPPUNIT_TEST(VectorBufferBase_VectorBuffer);
    CPPUNIT_TEST(VectorBufferBase_VectorBuffer2);
    CPPUNIT_TEST(VectorBufferBase_destruct_VectorBuffer);
    CPPUNIT_TEST(VectorBufferBase_swap);

    CPPUNIT_TEST(VectorBuffer_VectorBuffer);
    CPPUNIT_TEST(VectorBuffer_VectorBuffer2);
    CPPUNIT_TEST(VectorBuffer_destruct_VectorBuffer);
    CPPUNIT_TEST(VectorBuffer_allocateBuffer);
    CPPUNIT_TEST(VectorBuffer_deallocateBuffer);
    CPPUNIT_TEST(VectorBuffer_releaseBuffer);

    CPPUNIT_TEST(Vector);
    CPPUNIT_TEST(Vector_size);
    CPPUNIT_TEST(destruct_Vector);
    CPPUNIT_TEST(Vector2);
    CPPUNIT_TEST(Vector_capacity);
    CPPUNIT_TEST(operator_copy);
    CPPUNIT_TEST(operator_copy_capacity);
    CPPUNIT_TEST(size);
    CPPUNIT_TEST(capacity);
    CPPUNIT_TEST(isEmpty);
    CPPUNIT_TEST(at);
    CPPUNIT_TEST(at_const);
    CPPUNIT_TEST(operator__);
    CPPUNIT_TEST(operator__const);
    CPPUNIT_TEST(data);
    CPPUNIT_TEST(data_const);
    CPPUNIT_TEST(dataSlot);
    CPPUNIT_TEST(begin);
    CPPUNIT_TEST(end);
    CPPUNIT_TEST(const_begin);
    CPPUNIT_TEST(const_end);
    CPPUNIT_TEST(first);
    CPPUNIT_TEST(first_const);
    CPPUNIT_TEST(last);
    CPPUNIT_TEST(last_const);
    CPPUNIT_TEST(shrink);
    CPPUNIT_TEST(grow);
    CPPUNIT_TEST(resize);
    CPPUNIT_TEST(reserveCapacity);
    CPPUNIT_TEST(shrinkCapacity);
    CPPUNIT_TEST(clear);
    CPPUNIT_TEST(append_size);
    CPPUNIT_TEST(append);
    CPPUNIT_TEST(uncheckedAppend);
    CPPUNIT_TEST(append_vector);
    CPPUNIT_TEST(insert_size);
    CPPUNIT_TEST(insert);
    CPPUNIT_TEST(insert_vector);
    CPPUNIT_TEST(prepend_size);
    CPPUNIT_TEST(prepend);
    CPPUNIT_TEST(prepend_vector);
    CPPUNIT_TEST(remove);
    CPPUNIT_TEST(remove_length);
    CPPUNIT_TEST(removeLast);
    CPPUNIT_TEST(Vector3);
    CPPUNIT_TEST(fill_size);
    CPPUNIT_TEST(fill);
    CPPUNIT_TEST(appendRange);
    CPPUNIT_TEST(releaseBuffer);
    CPPUNIT_TEST(swap);
    CPPUNIT_TEST(deleteAllValues);

    CPPUNIT_TEST(swap_2args);

    CPPUNIT_TEST(operator_equal);
    CPPUNIT_TEST(operator_diff);


    CPPUNIT_TEST_SUITE_END();



    void VectorDestructor_false_destruct() CPPU_NOT_IMPLEMENTED
    void VectorDestructor_true_destruct() CPPU_NOT_IMPLEMENTED
    void VectorInitializer_false_initialize() CPPU_NOT_IMPLEMENTED
    void VectorInitializer_true_initialize() CPPU_NOT_IMPLEMENTED

    void VectorInitializer_true_true_initialize() CPPU_NOT_IMPLEMENTED
    void VectorMover_false_move() CPPU_NOT_IMPLEMENTED
    void VectorMover_false_moveOverlapping() CPPU_NOT_IMPLEMENTED

    void VectorMover_true_move() CPPU_NOT_IMPLEMENTED
    void VectorMover_true_moveOverlapping() CPPU_NOT_IMPLEMENTED
    void VectorCopier_false_uninitializedCopy() CPPU_NOT_IMPLEMENTED
    void VectorCopier_true_uninitializedCopy() CPPU_NOT_IMPLEMENTED
    void VectorFiller_false_uninitializedFill() CPPU_NOT_IMPLEMENTED
    void VectorFiller_true_uninitializedFill() CPPU_NOT_IMPLEMENTED
    
    void VectorComparer_false_compare() CPPU_NOT_IMPLEMENTED
    void VectorComparer_true_compare() CPPU_NOT_IMPLEMENTED
    
   
    void VectorTypeOperations_destruct() CPPU_NOT_IMPLEMENTED
    void VectorTypeOperations_initialize() CPPU_NOT_IMPLEMENTED
    void VectorTypeOperations_move() CPPU_NOT_IMPLEMENTED
    void VectorTypeOperations_moveOverlapping() CPPU_NOT_IMPLEMENTED
    void VectorTypeOperations_uninitializedCopy() CPPU_NOT_IMPLEMENTED
    void VectorTypeOperations_uninitializedFill() CPPU_NOT_IMPLEMENTED
    void VectorTypeOperations_compare() CPPU_NOT_IMPLEMENTED

    void VectorBufferBase_allocateBuffer() CPPU_NOT_IMPLEMENTED
    void VectorBufferBase_deallocateBuffer() CPPU_NOT_IMPLEMENTED
    void VectorBufferBase_buffer() CPPU_NOT_IMPLEMENTED
    void VectorBufferBase_buffer2() CPPU_NOT_IMPLEMENTED
    void VectorBufferBase_bufferSlot() CPPU_NOT_IMPLEMENTED
    void VectorBufferBase_capacity() CPPU_NOT_IMPLEMENTED
    void VectorBufferBase_releaseBuffer() CPPU_NOT_IMPLEMENTED
    void VectorBufferBase_VectorBuffer() CPPU_NOT_IMPLEMENTED
    void VectorBufferBase_VectorBuffer2() CPPU_NOT_IMPLEMENTED
    void VectorBufferBase_destruct_VectorBuffer() CPPU_NOT_IMPLEMENTED
    void VectorBufferBase_swap() CPPU_NOT_IMPLEMENTED

    void VectorBuffer_VectorBuffer() CPPU_NOT_IMPLEMENTED
    void VectorBuffer_VectorBuffer2() CPPU_NOT_IMPLEMENTED
    void VectorBuffer_destruct_VectorBuffer() CPPU_NOT_IMPLEMENTED
    void VectorBuffer_allocateBuffer() CPPU_NOT_IMPLEMENTED
    void VectorBuffer_deallocateBuffer() CPPU_NOT_IMPLEMENTED
    void VectorBuffer_releaseBuffer() CPPU_NOT_IMPLEMENTED

    void Vector() CPPU_NOT_IMPLEMENTED
    void Vector_size() CPPU_NOT_IMPLEMENTED
    void destruct_Vector() CPPU_NOT_IMPLEMENTED
    void Vector2() CPPU_NOT_IMPLEMENTED
    void Vector_capacity() CPPU_NOT_IMPLEMENTED
    void operator_copy() CPPU_NOT_IMPLEMENTED
    void operator_copy_capacity() CPPU_NOT_IMPLEMENTED
    void size() CPPU_NOT_IMPLEMENTED
    void capacity() CPPU_NOT_IMPLEMENTED
    void isEmpty() CPPU_NOT_IMPLEMENTED
    void at() CPPU_NOT_IMPLEMENTED
    void at_const() CPPU_NOT_IMPLEMENTED
    void operator__() CPPU_NOT_IMPLEMENTED
    void operator__const() CPPU_NOT_IMPLEMENTED
    void data() CPPU_NOT_IMPLEMENTED
    void data_const() CPPU_NOT_IMPLEMENTED
    void dataSlot() CPPU_NOT_IMPLEMENTED
    void begin() CPPU_NOT_IMPLEMENTED
    void end() CPPU_NOT_IMPLEMENTED
    void const_begin() CPPU_NOT_IMPLEMENTED
    void const_end() CPPU_NOT_IMPLEMENTED
    void first() CPPU_NOT_IMPLEMENTED
    void first_const() CPPU_NOT_IMPLEMENTED
    void last() CPPU_NOT_IMPLEMENTED
    void last_const() CPPU_NOT_IMPLEMENTED
    void shrink() CPPU_NOT_IMPLEMENTED
    void grow() CPPU_NOT_IMPLEMENTED
    void resize() CPPU_NOT_IMPLEMENTED
    void reserveCapacity() CPPU_NOT_IMPLEMENTED
    void shrinkCapacity() CPPU_NOT_IMPLEMENTED
    void clear() CPPU_NOT_IMPLEMENTED
    void append_size() CPPU_NOT_IMPLEMENTED
    void append() CPPU_NOT_IMPLEMENTED
    void uncheckedAppend() CPPU_NOT_IMPLEMENTED
    void append_vector() CPPU_NOT_IMPLEMENTED
    void insert_size() CPPU_NOT_IMPLEMENTED
    void insert() CPPU_NOT_IMPLEMENTED
    void insert_vector() CPPU_NOT_IMPLEMENTED
    void prepend_size() CPPU_NOT_IMPLEMENTED
    void prepend() CPPU_NOT_IMPLEMENTED
    void prepend_vector() CPPU_NOT_IMPLEMENTED
    void remove() CPPU_NOT_IMPLEMENTED
    void remove_length() CPPU_NOT_IMPLEMENTED
    void removeLast() CPPU_NOT_IMPLEMENTED
    void Vector3() CPPU_NOT_IMPLEMENTED
    void fill_size() CPPU_NOT_IMPLEMENTED
    void fill() CPPU_NOT_IMPLEMENTED
    void appendRange() CPPU_NOT_IMPLEMENTED
    void releaseBuffer() CPPU_NOT_IMPLEMENTED
    void swap() CPPU_NOT_IMPLEMENTED
    void deleteAllValues() CPPU_NOT_IMPLEMENTED

    void swap_2args() CPPU_NOT_IMPLEMENTED

    void operator_equal() CPPU_NOT_IMPLEMENTED
    void operator_diff() CPPU_NOT_IMPLEMENTED

    };



#endif // WTF_Vector_h

